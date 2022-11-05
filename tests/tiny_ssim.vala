/***********************************************************
@copyright 2003-2013 Loren Merritt

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110 USA
***********************************************************/

/***********************************************************
tiny_ssim.c
Computes the Structural Similarity Metric between two rawYV12 video files.
original algorithm:
Z. Wang, A. C. Bovik, H. R. Sheikh and E. P. Simoncelli,
  "Image quality assessment: From error visibility to structural similarity,"
  IEEE Transactions on Image Processing, vol. 13, no. 4, pp. 600-612, Apr. 2004.

To improve speed, this implementation uses the standard approximation of
overlapped 8x8 block sums, rather than the original gaussian weights.
***********************************************************/

public class tiny_ssim {

    static void FFSWAP<T> (out T a, out T b) {
        T SWAP_tmp = b; b = a; a = SWAP_tmp;
    }
    //  #define FFMIN (a,b) ((a) > (b) ? (b) : (a))

    const uint BIT_DEPTH = 8;
    const uint PIXEL_MAX = ((1 << BIT_DEPTH)-1);
    struct pixel : uint8 { }

    /****************************************************************************
    structural similarity metric
    ***************************************************************************/
    static void ssim_4x4x2_core (
        out pixel pix1,
        out uint stride1,
        out pixel pix2,
        out uint stride2,
        uint sums[2 * 4] // [2][4]
    ) {
        uint x;
        uint y;
        uint z;

        for (z = 0; z < 2; z++ ) {
            uint32 s1 = 0;
            uint32 s2 = 0;
            uint32 ss = 0;
            uint32 s12 = 0;
            for (y = 0; y < 4; y++ )
                for (x = 0; x < 4; x++ ) {
                    uint a = pix1[x+y*stride1];
                    uint b = pix2[x+y*stride2];
                    s1  += a;
                    s2  += b;
                    ss  += a*a;
                    ss  += b*b;
                    s12 += a*b;
                }
            sums[z][0] = s1;
            sums[z][1] = s2;
            sums[z][2] = ss;
            sums[z][3] = s12;
            pix1 += 4;
            pix2 += 4;
        }
    }

    //  #if BIT_DEPTH > 9
    struct type : float { }
    //  #else
    //      typedef uint type;
    //  #endif

    static float ssim_end1 (uint s1, uint s2, uint ss, uint s12 ) {
    /***********************************************************
    Maximum value for 10-bit is: ss*64 = (2^10-1)^2*16*4*64 = 4286582784, which will overflow in some cases.
    s1*s1, s2*s2, and s1*s2 also obtain this value for edge cases: ((2^10-1)*16*4)^2 = 4286582784.
    Maximum value for 9-bit is: ss*64 = (2^9-1)^2*16*4*64 = 1069551616, which will not overflow.
    ***********************************************************/

    //  #if BIT_DEPTH > 9
        float ssim_c1 = 0.01f * 0.01f * PIXEL_MAX * PIXEL_MAX * 64;
        float ssim_c2 = 0.03f * 0.03f * PIXEL_MAX * PIXEL_MAX * 64 * 63;
    //  #else
    //      uint ssim_c1 = (uint)(.01*.01*PIXEL_MAX*PIXEL_MAX*64 + .5);
    //      uint ssim_c2 = (uint)(.03*.03*PIXEL_MAX*PIXEL_MAX*64*63 + .5);
    //  #endif
        type fs1 = s1;
        type fs2 = s2;
        type fss = ss;
        type fs12 = s12;
        type vars = fss*64 - fs1*fs1 - fs2*fs2;
        type covar = fs12*64 - fs1*fs2;
        return (float)(2*fs1*fs2 + ssim_c1) * (float)(2*covar + ssim_c2)
            / ((float)(fs1*fs1 + fs2*fs2 + ssim_c1) * (float)(vars + ssim_c2));
    }

    static float ssim_end4 (
        uint sum0[5 * 4], // [5][4]
        uint sum1[5 * 4], // [5][4]
        uint width_2
    ) {
        float ssim = 0.0f;

        for (uint i = 0; i < width_2; i++ )
            ssim += ssim_end1 (sum0[i][0] + sum0[i+1][0] + sum1[i][0] + sum1[i+1][0],
                            sum0[i][1] + sum0[i+1][1] + sum1[i][1] + sum1[i+1][1],
                            sum0[i][2] + sum0[i+1][2] + sum1[i][2] + sum1[i+1][2],
                            sum0[i][3] + sum0[i+1][3] + sum1[i][3] + sum1[i+1][3] );
        return ssim;
    }

    float ssim_plane (
        pixel pix1,
        out uint stride1,
        pixel pix2, out
        uint stride2,
        uint width_2,
        uint height_2,
        void *buf,
        uint cnt
    ) {
        uint z = 0;
        uint x;
        uint y;
        float ssim = 0.0f;
        uint sum0[4] = (uint *)buf;
        uint sum1[4] = sum0 + (width_2 >> 2) + 3;
        width_2 >>= 2;
        height_2 >>= 2;
        for (y = 1; y < height_2; y++ ) {
            for (; z <= y; z++ ) {
                FFSWAP<void*> (out sum0, out sum1);
                for (x = 0; x < width_2; x+=2 )
                    ssim_4x4x2_core (out pix1[4*(x+z*stride1)], stride1, out pix2[4*(x+z*stride2)], stride2, out sum0[x] );
            }
            for (x = 0; x < width_2-1; x += 4 )
                ssim += ssim_end4 (sum0+x, sum1+x, FFMIN (4,width_2-x-1) );
        }
    //     *cnt = (height_2-1) * (width_2-1);
        return ssim / ((height_2-1) * (width_2-1));
    }


    uint64 ssd_plane (out uint8[] pix1, uint8[] pix2, uint size ) {
        uint64 ssd = 0;
        for (uint i = 0; i < size; i++ ) {
            uint d = pix1[i] - pix2[i];
            ssd += d*d;
        }
        return ssd;
    }

    static double ssd_to_psnr (uint64 ssd, uint64 denom ) {
        return -10*log ((double)ssd/(denom*255*255))/log (10);
    }

    static double ssim_db (double ssim, double weight ) {
        return 10*(log (weight)/log (10)-log (weight-ssim)/log (10));
    }

    static void print_results (uint64 ssd[3], double ssim[3], uint frames, uint width, uint height) {
        GLib.print ("PSNR Y:%.3f  U:%.3f  V:%.3f  All:%.3f | ",
                ssd_to_psnr (ssd[0], (uint64)frames*width*height ),
                ssd_to_psnr (ssd[1], (uint64)frames*width*height/4 ),
                ssd_to_psnr (ssd[2], (uint64)frames*width*height/4 ),
                ssd_to_psnr (ssd[0] + ssd[1] + ssd[2], (uint64)frames*width*height*3/2 ) );
        GLib.print ("SSIM Y:%.5f U:%.5f V:%.5f All:%.5f (%.5f)",
                ssim[0] / frames,
                ssim[1] / frames,
                ssim[2] / frames,
                (ssim[0]*4 + ssim[1] + ssim[2]) / (frames*6),
                ssim_db (ssim[0] * 4 + ssim[1] + ssim[2], frames*6));
    }

    uint main (
        uint argc,
        string argv[]
    ) {
        GLib.File f[2];
        uint8 *buf[2];
        uint8 *plane[2 * 3]; // [2][3];
        uint temp;
        uint64 ssd[3] = {0,0,0};
        double ssim[3] = {0,0,0};
        uint frame_size, width, height;
        uint frames, seek;

        if (argc<4 || 2 != sscanf (argv[3], "%dx%d", out width, out height) ) {
            GLib.print ("tiny_ssim <file1.yuv> <file2.yuv> <width_2>x<height_2> [<seek>]\n");
            return -1;
        }

        f[0] = fopen (argv[1], "rb");
        f[1] = fopen (argv[2], "rb");
        sscanf (argv[3], "%dx%d", out width, out height);

        if (width <= 0 || height<=0 || width * (int64)height >= int.MAX/3 || (int64)2 * width + 12 >= int.MAX / sizeof (uint)) {
            fprintf (stderr, "Dimensions are too large, or invalid\n");
            return -2;
        }

        frame_size = width*height*3LL/2;
        for (uint i = 0; i < 2; i++ ) {
            buf[i] = malloc (frame_size);
            plane[i][0] = buf[i];
            plane[i][1] = plane[i][0] + width * height;
            plane[i][2] = plane[i][1] + width * height / 4;
        }
        temp = malloc ((2 * width + 12) * sizeof (uint));
        seek = argc<5 ? 0 : atoi (argv[4]);
        fseek (f[seek<0], seek < 0 ? -seek : seek, SEEK_SET);

        for (frames=0;; frames++ ) {
            uint64 ssd_one[3];
            double ssim_one[3];
            if (fread (buf[0], frame_size, 1, f[0]) != 1) break;
            if (fread (buf[1], frame_size, 1, f[1]) != 1) break;
            for (uint i = 0; i < 3; i++ ) {
                ssd_one[i] = ssd_plane (plane[0][i], plane[1][i], width*height>>2*!!i );
                ssim_one[i] = ssim_plane (plane[0][i], width>>!!i,
                                        plane[1][i], width>>!!i,
                                        width>>!!i, height>>!!i, temp, null );
                ssd[i] += ssd_one[i];
                ssim[i] += ssim_one[i];
            }

            GLib.print ("Frame %d | ", frames);
            print_results (ssd_one, ssim_one, 1, width, height);
            GLib.print ("                \r");
            fflush (stdout);
        }

        if (!frames ) return 0;

        GLib.print ("Total %d frames | ", frames);
        print_results (ssd, ssim, frames, width, height);
        GLib.print ("\n");

        return 0;
    }

}

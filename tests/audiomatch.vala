/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/


static uint FFMIN (uint a, uint b) {
    return ((a) > (b) ? (b) : (a));
}
static uint FFMAX (uint a, uint b) {
    return ((a) > (b) ? (a) : (b));
}

static int64 fsize (GLib.File f) {
    int64 end;
    int64 pos = ftell (f);
    fseek (f, 0, SEEK_END);
    end = ftell (f);
    fseek (f, pos, SEEK_SET);
    return end;
}

uint main (
    uint argc,
    string[] argv
) {
    GLib.File f[2];
    uint pos;
    uint siglen;
    uint datlen;
    uint bestpos = 0;
    double bestc = 0;
    double sigamp = 0;
    int16[] signal;
    int16[] data;
    uint maxshift = 16384;

    if (argc < 3) {
        GLib.print ("audiomatch <testfile> <reffile>\n");
        GLib.print ("WAV headers are skipped automatically.\n");
        return 1;
    }

    f[0] = fopen (argv[1], "rb");
    f[1] = fopen (argv[2], "rb");
    if (!f[0] || !f[1]) {
        fprintf (stderr, "Could not open input files.\n");
        return 1;
    }

    for (uint i = 0; i < 2; i++) {
        uint8 p[100];
        if (fread (p, 1, 12, f[i]) != 12)
            return 1;
        if (!memcmp (p, "RIFF", 4) &&
            !memcmp (p + 8, "WAVE", 4)) {
            if (fread (p, 1, 8, f[i]) != 8)
                return 1;
            while (memcmp (p, "data", 4)) {
                uint s = p[4] | p[5] << 8 | p[6] << 16 | p[7] << 24;
                fseek (f[i], s, SEEK_CUR);
                if (fread (p, 1, 8, f[i]) != 8)
                    return 1;
            }
        } else {
            fseek (f[i], -12, SEEK_CUR);
        }
    }

    datlen = fsize (f[0]) - ftell (f[0]);
    siglen = fsize (f[1]) - ftell (f[1]);
    data = malloc (datlen * sizeof (data));
    signal = malloc (siglen * sizeof (signal));

    if (fread (data  , 1, datlen, f[0]) != datlen)
        return 1;
    if (fread (signal, 1, siglen, f[1]) != siglen)
        return 1;
    datlen /= 2;
    siglen /= 2;

    for (uint i = 0; i < siglen; i++) {
        signal[i] = ((uint8[])(signal + i))[0] + 256*((uint8[])(signal + i))[1];
        sigamp += signal[i] * signal[i];
    }
    for (uint i = 0; i < datlen; i++)
        data[i] = ((uint8[])(data + i))[0] + 256*((uint8[])(data + i))[1];

    for (pos = 0; pos < maxshift; pos = pos < 0 ? -pos: -pos-1) {
        int64 c = 0;
        uint testlen = FFMIN (siglen, datlen-pos);
        for (uint i = FFMAX (0, -pos); i < testlen; i++) {
            uint j = pos + i;
            c += signal[i] * data[j];
        }
        if (fabs (c) > sigamp * 0.94)
            maxshift = FFMIN (maxshift, fabs (pos)+32);
        if (fabs (c) > fabs (bestc)) {
            bestc = c;
            bestpos = pos;
        }
    }
    GLib.print ("presig: %d postsig:%d c:%7.4f lenerr:%d\n", bestpos, datlen - siglen - bestpos, bestc / sigamp, datlen - siglen);

    return 0;
}

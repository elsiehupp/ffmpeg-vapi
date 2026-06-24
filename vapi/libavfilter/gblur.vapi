/***********************************************************
Copyright (c) 2011 Pascal Getreuer
Copyright (c) 2016 Paul B Mahol

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above
   copyright notice, this list of conditions and the following
   disclaimer in the documentation and/or other materials provided
   with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
***********************************************************/

[CCode (cname="struct GBlurContext",cheader_filename="subprojects/ffmpeg/libavfilter/gblur.h")]
[Compact]
public class GBlurContext {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public float sigma;

    [CCode (cname="")]
    public float sigmaV;

    [CCode (cname="")]
    public int steps;

    [CCode (cname="")]
    public int planes;

    [CCode (cname="")]
    public int depth;

    [CCode (cname="")]
    public int planewidth[4];

    [CCode (cname="")]
    public int planeheight[4];

    [CCode (cname="")]
    public float[] buffer;

    [CCode (cname="")]
    public float boundaryscale;

    [CCode (cname="")]
    public float boundaryscaleV;

    [CCode (cname="")]
    public float postscale;

    [CCode (cname="")]
    public float postscaleV;

    [CCode (cname="")]
    public float nu;

    [CCode (cname="")]
    public float nuV;

    [CCode (cname="")]
    public int nb_planes;

    public delegate void HorizSliceDelegate (
        float[] buffer,
        int width,
        int height,
        int steps,
        float nu,
        float bscale
    );

    [CCode (cname="horiz_slice")]
    public HorizSliceDelegate horiz_slice;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/gblur.h")]
public void ff_gblur_init (
    GBlurContext? s
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/gblur.h")]
public void ff_gblur_init_x86 (
    GBlurContext? s
);

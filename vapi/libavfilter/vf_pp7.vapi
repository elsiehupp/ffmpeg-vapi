/***********************************************************
Copyright (c) 2005 Michael Niedermayer <michaelni@gmx.at>
Copyright (c) 2014 Arwa Arif <arwaarif1994@gmail.com>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
***********************************************************/

[CCode (cname="",cheader_filename="")]
[Compact]
public class PP7Context {
    AVClass *class;

    [CCode (cname="")]
    public int thres2[99][16];

    [CCode (cname="")]
    public int qp;

    [CCode (cname="")]
    public int mode;

    [CCode (cname="")]
    public int qscale_type;

    [CCode (cname="")]
    public int hsub;

    [CCode (cname="")]
    public int vsub;

    [CCode (cname="")]
    public int temp_stride;

    uint8[] src;

    [CCode (cname="requantize")]
    public int (*requantize)(
        PP7Context *p,
        int16[] src,
        int qp
    );

    [CCode (cname="*dctB")]
    public void (*dctB)(
        int16[] dst,
        int16[] src
    );

}

[CCode (cname="",cheader_filename="")]
public void ff_pp7_init_x86 (
    PP7Context *pp7
);

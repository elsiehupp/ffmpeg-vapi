/***********************************************************
Copyright (c) 2002 Michael Niedermayer <michaelni@gmx.at>
Copyright (c) 2011 Stefano Sabatini
Copyright (c) 2018 Danil Iashchenko

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

[CCode (cname="",cheader_filename="")]
[Compact]
public class FilterParam {
    [CCode (cname="")]
    public int radius;

    [CCode (cname="")]
    public int power;

    string radius_expr;
}

[CCode (cname="",cheader_filename="")]
public define Y 0
public define U 1
public define V 2
public define A 3

[CCode (cname="",cheader_filename="")]
public int ff_boxblur_eval_filter_params (
    AVFilterLink *inlink,
    FilterParam *luma_param,
    FilterParam *chroma_param,
    FilterParam *alpha_param
);

#endif // AVFILTER_BOXBLUR_H

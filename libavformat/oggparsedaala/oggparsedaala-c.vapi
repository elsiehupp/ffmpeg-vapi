/*
 * Ogg Daala parser
 * Copyright (C) 2015 Rostislav Pehlivanov <atomnuker gmail com>
 * Copyright (C) 2015 Vittorio Giovara <vittorio.giovara gmail com>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

const struct ogg_codec ff_daala_codec = {
    //  .name             = "Daala",
    //  .magic            = "\200daala",
    //  .magicsize        = 6,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    );           = daala_header,
    [CCode (cname="", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );           = daala_packet,
    [CCode (cname="", cheader="")]
    public override uint64 gptopts (
        AVFormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );          = daala_gptopts,
    //  .granule_is_start = 1,
    //  .nb_header        = 3,
};

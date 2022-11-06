/*
 * Ogg bitstream support
 * Luca Barbato <lu_zero@gentoo.org>
 * Based on tcvp implementation
 */

/*
    Copyright (C) 2005  Michael Ahlberg, Måns Rullgård

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation
    files (the "Software"), to deal in the Software without
    restriction, including without limitation the rights to use, copy,
    modify, merge, publish, distribute, sublicense, and/or sell copies
    of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.
 */

AVInputFormat ff_ogg_demuxer = {
    .name           = "ogg",
    .long_name      = NULL_IF_CONFIG_SMALL("Ogg"),
    .priv_data_size = sizeof(struct ogg),
    .read_probe     = ogg_probe,
    .read_header    = ogg_read_header,
    .read_packet    = ogg_read_packet,
    .read_close     = ogg_read_close,
    .read_seek      = ogg_read_seek,
    .read_timestamp = ogg_read_timestamp,
    .extensions     = "ogg",
    .flags          = AVFMT_GENERIC_INDEX | AVFMT_TS_DISCONT | AVFMT_NOBINSEARCH,
};

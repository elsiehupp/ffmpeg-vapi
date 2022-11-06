/**
    @copyright 2005  Michael Ahlberg, Måns Rullgård

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation
    files (the "Software", to deal in the Software without
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
**/

const struct ogg_codec ff_ogm_video_codec = {
    //  .magic = "\001video",
    //  .magicsize = 6,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); = ogm_header,
    [CCode (cname="", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    ); = ogm_packet,
    //  .granule_is_start = 1,
    //  .nb_header = 2,
}

const struct ogg_codec ff_ogm_audio_codec = {
    //  .magic = "\001audio",
    //  .magicsize = 6,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); = ogm_header,
    [CCode (cname="", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    ); = ogm_packet,
    //  .granule_is_start = 1,
    //  .nb_header = 2,
}

const struct ogg_codec ff_ogm_text_codec = {
    //  .magic = "\001text",
    //  .magicsize = 5,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); = ogm_header,
    [CCode (cname="", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    ); = ogm_packet,
    //  .granule_is_start = 1,
    //  .nb_header = 2,
}

const struct ogg_codec ff_ogm_old_codec = {
    //  .magic = "\001Direct Show Samples embedded in Ogg",
    //  .magicsize = 35,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); = ogm_dshow_header,
    [CCode (cname="", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    ); = ogm_packet,
    //  .granule_is_start = 1,
    //  .nb_header = 1,
}

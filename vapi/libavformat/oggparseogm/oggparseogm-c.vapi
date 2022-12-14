/***********************************************************
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
***********************************************************/

namespace LibAVFormat {

[CCode (cname="ff_ogm_video_codec", cheader_filename="")]
public class OGMVideoCodec : OggCodec {
    [CCode (cname="", cheader_filename="")]
    public override uint8[] magic {
        public get {
            return "\001video".data;
        }
    }
    //  .magicsize = 6,
    [CCode (cname="ogm_header", cheader_filename="")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="ogm_packet", cheader_filename="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    //  .granule_is_start = 1,
    //  .nb_header = 2,
}

[CCode (cname="ff_ogm_audio_codec", cheader_filename="")]
public class OGMAudioCodec : OggCodec {
    [CCode (cname="", cheader_filename="")]
    public override uint8[] magic {
        public get {
            return "\001audio".data;
        }
    }
    //  .magicsize = 6,
    [CCode (cname="ogm_header", cheader_filename="")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="ogm_packet", cheader_filename="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    //  .granule_is_start = 1,
    //  .nb_header = 2,
}

[CCode (cname="ff_ogm_text_codec", cheader_filename="")]
public class OGMTextCodec : OggCodec {
    [CCode (cname="", cheader_filename="")]
    public override uint8[] magic {
        public get {
            return "\001text".data;
        }
    }
    //  .magicsize = 5,
    [CCode (cname="ogm_header", cheader_filename="")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="ogm_packet", cheader_filename="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    //  .granule_is_start = 1,
    //  .nb_header = 2,
}

[CCode (cname="ff_ogm_old_codec", cheader_filename="")]
public class OGMOldCodec : OggCodec {
    [CCode (cname="", cheader_filename="")]
    public override uint8[] magic {
        public get {
            return "\001Direct Show Samples embedded in Ogg".data;
        }
    }
    //  .magicsize = 35,
    [CCode (cname="ogm_dshow_header", cheader_filename="")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="ogm_packet", cheader_filename="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    //  .granule_is_start = 1,
    //  .nb_header = 1,
}

} // namespace LibAVFormat

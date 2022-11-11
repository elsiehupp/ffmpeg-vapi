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

[CCode (cname="ff_vorbis_codec", cheader="")]
public class VorbisCodec : OggCodec {
    public override int8[] magic {
        public get {
            return "\001vorbis";
        }
    }
    //  .magicsize = 7,
    [CCode (cname="vorbis_header", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    );
    [CCode (cname="vorbis_packet", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    [CCode (cname="vorbis_cleanup", cheader="")]
    public override void cleanup (
        AVFormatContext format_context,
        int idx
    );
    //  .nb_header = 3,
}

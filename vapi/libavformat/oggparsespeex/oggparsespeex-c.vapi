/***********************************************************
@copyright 2008  Reimar Döffinger

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

[CCode (cname="ff_speex_codec", cheader_filename="")]
public class SpeexCodec : OggCodec {
    [CCode (cname="", cheader_filename="")]
    public override uint8[] magic {
        public get {
            return "Speex   ".data;
        }
    }
    //  .magicsize = 8,
    [CCode (cname="speex_header", cheader_filename="")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="speex_packet", cheader_filename="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    //  .nb_header = 2,
}

} // namespace LibAVFormat

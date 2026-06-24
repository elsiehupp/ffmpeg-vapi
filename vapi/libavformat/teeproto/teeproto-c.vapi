/***********************************************************
@brief Tee output protocol
@copyright 2016 Michael Niedermayer
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

[CCode (cname="tee_class",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
public class TeeURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override string class_name {
        public get {
            return "tee";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option",cheader_filename="")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct TeeContext",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
[Compact]
public class TeePrivateData { }

[CCode (cname="ff_tee_protocol",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
public class TeeURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override string name {
        public get {
            return "tee";

        }

    }

    [CCode (cname="tee_open",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="tee_write",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="tee_close",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/teeproto.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TeePrivateData);

        }

    }
    //  .priv_data_class = tee_class,
    //  .default_whitelist = "crypto,file,http,https,httpproxy,rtmp,tcp,tls";
    //      }
    //  }
}

} // namespace LibAVFormat

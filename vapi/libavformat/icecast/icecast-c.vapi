/***********************************************************
@brief Icecast protocol for FFmpeg
@copyright 2014 Marvin Scholz
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

[CCode (cname="icecast_context_class",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
public class IceCastURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override string class_name {
        public get {
            return "icecast";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
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

            };

        }

    }
    //  .option = options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct IcecastContext",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
[Compact]
public class IceCastPrivateData { }

[CCode (cname="ff_icecast_protocol",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
public class IceCastURLProtocol : URLProtocol {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override string name {
        public get {
            return "icecast";

        }

    }

    [CCode (cname="icecast_open",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="icecast_write",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="icecast_close",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (IceCastPrivateData);

        }

    }
    //  .priv_data_class = icecast_context_class,

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/icecast.c")]
    public override URLProtocolFlags flags {
        public get {
            return URLProtocolFlags.NETWORK;

        }

    }
}

} // namespace LibAVFormat

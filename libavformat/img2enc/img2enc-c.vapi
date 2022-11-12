/***********************************************************
Image format
@copyright 2000, 2001, 2002 Fabrice Bellard
@copyright 2004 Michael Niedermayer
***********************************************************/
/***********************************************************
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

namespace LibAVFormat {

//  #define OFFSET(x) offsetof(VideoMuxData, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option muxoptions[] = {
//      { "update",       "continuously overwrite one file", OFFSET(update),  AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0,       1, ENC },
//      { "start_number", "set first number in the sequence", OFFSET(img_number), AV_OPT_TYPE_INT,  { .i64 = 1 }, 0, INT_MAX, ENC },
//      { "strftime",     "use strftime for filename", OFFSET(use_strftime),  AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
//      { "frame_pts",    "use current frame pts for filename", OFFSET(frame_pts),  AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
//      { "atomic_writing", "write files atomically (using temporary files and renames)", OFFSET(use_rename), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
//      { NULL },
//  }

#if CONFIG_IMAGE2_MUXER
[CCode (cname="img2mux_class", cheader_filename="")]
public class Image2MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "image2 muxer";
        }
    }
    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = muxoptions,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_image2_muxer", cheader_filename="")]
public class Image2Muxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "image2";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "image2 sequence";
        }
    }
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "bmp,dpx,jls,jpeg,jpg,ljpg,pam,pbm,pcx,pgm,pgmyuv,png," +
                      "ppm,sgi,tga,tif,tiff,jp2,j2c,j2k,xwd,sun,ras,rs,im1,im8,im24," +
                      "sunras,xbm,xface,pix,y";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoMuxData);
        }
    }
    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MJPEG;
        }
    }
    [CCode (cname="write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="query_codec", cheader_filename="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS | AVFMT_NODIMENSIONS | AVFMT_NOFILE;
        }
    }
    //  .priv_class = img2mux_class,
}
#endif

#if CONFIG_IMAGE2PIPE_MUXER
[CCode (cname="ff_image2pipe_muxer", cheader_filename="")]
public class Image2PipeMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "image2pipe";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "piped image2 sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoMuxData);
        }
    }
    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MJPEG;
        }
    }
    [CCode (cname="write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="query_codec", cheader_filename="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS | AVFMT_NODIMENSIONS;
        }
    }
}
#endif

} // namespace LibAVFormat

/***********************************************************
@brief MOV demuxer
@copyright 2001 Fabrice Bellard
@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>

first version by Francois Revol <revol@free.fr>
seek function by Gael Chardon <gael.dev@4now.net>
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

//  #define OFFSET(x) offsetof(MOVContext, x)
//  #define FLAGS AV_OPT_FLAG_VIDEO_PARAM | AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option mov_options[] = {
//      {"use_absolute_path",
//          "allow using absolute path when opening alias, this is a possible security issue",
//          OFFSET(use_absolute_path), AV_OPT_TYPE_BOOL, {.i64 = 0},
//          0, 1, FLAGS},
//      {"seek_streams_individually",
//          "Seek each stream individually to the to the closest point",
//          OFFSET(seek_individually), AV_OPT_TYPE_BOOL, { .i64 = 1 },
//          0, 1, FLAGS},
//      {"ignore_editlist", "Ignore the edit list atom.", OFFSET(ignore_editlist), AV_OPT_TYPE_BOOL, {.i64 = 0},
//          0, 1, FLAGS},
//      {"advanced_editlist",
//          "Modify the AVIndex according to the editlists. Use this option to decode in the order specified by the edits.",
//          OFFSET(advanced_editlist), AV_OPT_TYPE_BOOL, {.i64 = 1},
//          0, 1, FLAGS},
//      {"ignore_chapters", "", OFFSET(ignore_chapters), AV_OPT_TYPE_BOOL, {.i64 = 0},
//          0, 1, FLAGS},
//      {"use_mfra_for",
//          "use mfra for fragment timestamps",
//          OFFSET(use_mfra_for), AV_OPT_TYPE_INT, {.i64 = FF_MOV_FLAG_MFRA_AUTO},
//          -1, FF_MOV_FLAG_MFRA_PTS, FLAGS,
//          "use_mfra_for"},
//      {"auto", "auto", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_MFRA_AUTO}, 0, 0,
//          FLAGS, "use_mfra_for" },
//      {"dts", "dts", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_MFRA_DTS}, 0, 0,
//          FLAGS, "use_mfra_for" },
//      {"pts", "pts", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_MFRA_PTS}, 0, 0,
//          FLAGS, "use_mfra_for" },
//      { "export_all", "Export unrecognized metadata entries", OFFSET(export_all),
//          AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, .flags = FLAGS },
//      { "export_xmp", "Export full XMP metadata", OFFSET(export_xmp),
//          AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, .flags = FLAGS },
//      { "activation_bytes", "Secret bytes for Audible AAX files", OFFSET(activation_bytes),
//          AV_OPT_TYPE_BINARY, .flags = AV_OPT_FLAG_DECODING_PARAM },
//      { "audible_fixed_key", // extracted from libAAX_SDK.so and AAXSDKWin.dll files!
//          "Fixed key used for handling Audible AAX files", OFFSET(audible_fixed_key),
//          AV_OPT_TYPE_BINARY, {.str="77214d4b196a87cd520045fd20a51d67"},
//          //  .flags = AV_OPT_FLAG_DECODING_PARAM },
//      { "decryption_key", "The media decryption key (hex)", OFFSET(decryption_key), AV_OPT_TYPE_BINARY, .flags = AV_OPT_FLAG_DECODING_PARAM },
//      { "enable_drefs", "Enable external track support.", OFFSET(enable_drefs), AV_OPT_TYPE_BOOL,
//          {.i64 = 0}, 0, 1, FLAGS },

//      { NULL },
//  }

[CCode (cname="mov_class", cheader_filename="")]
public class MOVDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "mov,mp4,m4a,3gp,3g2,mj2";
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
    //  .option = mov_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_mov_demuxer", cheader_filename="")]
public class MOVDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mov,mp4,m4a,3gp,3g2,mj2";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "QuickTime / MOV";
        }
    }
    //  .priv_class = mov_class,
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVContext);
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mov,mp4,m4a,3gp,3g2,mj2";
        }
    }

    [CCode (cname="mov_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="mov_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="mov_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mov_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="mov_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NO_BYTE_SEEK | AVFMT_SEEK_TO_PTS;
        }
    }
}

} // namespace LibAVFormat

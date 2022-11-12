/***********************************************************
@brief RAW demuxers
@copyright 2007 Aurelien Jacobs <aurel@gnuage.org>
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

[CCode (cname="struct FFRawVideoDemuxerContext", cheader_filename="")]
public struct FFRawVideoDemuxerContext {
    /***********************************************************
    @brief Class for private options.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class class;

    [CCode (cname="", cheader_filename="")]
    public int raw_packet_size;

    /***********************************************************
    @brief String describing video size, set by a private option.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string video_size;

    /***********************************************************
    @brief Set by a private option.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string pixel_format;

    /***********************************************************
    @brief LibAVUtil.Rational describing framerate, set by a private option.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Rational framerate;
}

[CCode (cname="struct FFRawDemuxerContext", cheader_filename="")]
public struct FFRawDemuxerContext {
    /***********************************************************
    @brief Class for private options.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class class;

    [CCode (cname="", cheader_filename="")]
    public int raw_packet_size;
}

//  extern const LibAVUtil.Option ff_rawvideo_options[];
//  extern const LibAVUtil.Option ff_raw_options[];

[CCode (cname="", cheader_filename="")]
public int ff_raw_read_partial_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet
);

[CCode (cname="", cheader_filename="")]
public int ff_raw_audio_read_header (
    AVFormatContext format_context
);

[CCode (cname="", cheader_filename="")]
public int ff_raw_video_read_header (
    AVFormatContext format_context
);

[CCode (cname="", cheader_filename="")]
public int ff_raw_subtitle_read_header (
    AVFormatContext format_context
);

[CCode (cname="", cheader_filename="")]
public int ff_raw_data_read_header (
    AVFormatContext format_context
);

//  #define FF_RAW_DEMUXER_CLASS (name)\
//  public const LibAVUtil.Class name ## _demuxer_class = {
//      //  .class_name = #name " demuxer",
//      //  .item_name = base.item_name,
//      //  .option = ff_raw_options,
//      //  .version = LibAVUtil.Version.INT,
//  }

//  #define FF_RAWVIDEO_DEMUXER_CLASS (name)\
//  public const LibAVUtil.Class name ## _demuxer_class = {
//      //  .class_name = #name " demuxer",
//      //  .item_name = base.item_name,
//      //  .option = ff_rawvideo_options,
//      //  .version = LibAVUtil.Version.INT,
//  }

//  #define FF_DEF_RAWVIDEO_DEMUXER2 (shortname, longname, probe, ext, id, flag)\
//  FF_RAWVIDEO_DEMUXER_CLASS (shortname)\
//  AVInputFormat ff_ ## shortname ## _demuxer = {
//      //  .name = #shortname,
//      //  .long_name = NULL_IF_CONFIG_SMALL (longname),
//      //  .read_probe = probe,
//      //  .read_header = ff_raw_video_read_header,
//      //  .read_packet = ff_raw_read_partial_packet,
//      //  .extensions = ext,
//      //  .flags = flag,
//      //  .raw_codec_id = id,
//      //  .priv_data_size = sizeof (FFRawVideoDemuxerContext),
//      //  .priv_class = shortname ## _demuxer_class,
//  }

//  #define FF_DEF_RAWVIDEO_DEMUXER (shortname, longname, probe, ext, id)\
//  FF_DEF_RAWVIDEO_DEMUXER2 (shortname, longname, probe, ext, id, AVFMT_GENERIC_INDEX)

//  #define FF_RAWSUB_DEMUXER_CLASS (name)\
//  public const LibAVUtil.Class name ## _demuxer_class = {
//      //  .class_name = #name " demuxer",
//      //  .item_name = base.item_name,
//      //  .option = ff_raw_options,
//      //  .version = LibAVUtil.Version.INT,
//  }

//  #define FF_DEF_RAWSUB_DEMUXER (shortname, longname, probe, ext, id, flag)\
//  FF_RAWSUB_DEMUXER_CLASS (shortname)\
//  AVInputFormat ff_ ## shortname ## _demuxer = {
//      //  .name = #shortname,
//      //  .long_name = NULL_IF_CONFIG_SMALL (longname),
//      //  .read_probe = probe,
//      //  .read_header = ff_raw_subtitle_read_header,
//      //  .read_packet = ff_raw_read_partial_packet,
//      //  .extensions = ext,
//      //  .flags = flag,
//      //  .raw_codec_id = id,
//      //  .priv_data_size = sizeof (FFRawDemuxerContext),
//      //  .priv_class = shortname ## _demuxer_class,
//  }

} // namespace LibAVFormat

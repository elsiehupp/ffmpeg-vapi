/***********************************************************
Copyright (c) 2013 Andrew Kelley

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

/***********************************************************
@file libavfilter audio filtering API usage example
@example filter_audio.c

This example will generate a sine wave audio, pass it through a simple filter
chain, and then compute the MD5 checksum of the output data.

The filter chain it uses is:
(input) . abuffer . volume . aformat . abuffersink . (output)

abuffer: This provides the endpoint where you can feed the decoded samples.
volume: In this example we hardcode it to 0.90.
aformat: This converts the samples to the samplefreq, channel layout,
         and sample format required by the audio device.
abuffersink: This provides the endpoint where you can read the samples after
             they have passed through the filter chain.
***********************************************************/

//#include <inttypes.h>
//#include <math.h>
//#include <stdio.h>
//#include <stdlib.h>

//#include <libavutil/channel_layout.h>
//#include <libavutil/md5.h>
//#include <libavutil/mem.h>
//#include <libavutil/opt.h>
//#include <libavutil/samplefmt.h>

//#include <libavfilter/avfilter.h>
//#include <libavfilter/buffersink.h>
//#include <libavfilter/buffersrc.h>

private class FilterAudioApplication : GLib.Application {

    private const size_t INPUT_SAMPLERATE = 48000;
    private const LibAVUtil.SampleFormat INPUT_FORMAT = LibAVUtil.SampleFormat.FLOAT_PLANAR;
    private const AVChannelLayout INPUT_CHANNEL_LAYOUT = (
        AVChannelLayout)AV_CHANNEL_LAYOUT_5POINT0;

    private const float VOLUME_VAL = 0.90;

    private static int init_filter_graph (
        out AVFilterGraph? graph_out,
        out AVFilterContext? src_out,
        out AVFilterContext? sink_out
    ) {
        AVFilterGraph? filter_graph;
        AVFilterContext? abuffer_ctx;
        AVFilter ? abuffer;
        AVFilterContext? volume_ctx;
        AVFilter ? volume;
        AVFilterContext? aformat_ctx;
        AVFilter ? aformat;
        AVFilterContext? abuffersink_ctx;
        AVFilter ? abuffersink;

        AVDictionary? options_dict = null;
        uint8 options_str[1024];
        uint8 ch_layout[64];

        int err;

        /***********************************************************
        Create a new filtergraph, which will contain all the filters.
        ***********************************************************/
        filter_graph = avfilter_graph_alloc ();
        if (
            !filter_graph
        ) {
            fprintf (
                stderr,
                "Unable to create filter graph.\n"
            );

            return AVERROR (
                ENOMEM
            );

        }

        /***********************************************************
        Create the abuffer filter;
        it will be used for feeding the data into the graph.
        ***********************************************************/
        abuffer = avfilter_get_by_name (
            "abuffer"
        );

        if (
            !abuffer
        ) {
            fprintf (
                stderr,
                "Could not find the abuffer filter.\n"
            );

            return AVERROR_FILTER_NOT_FOUND;
        }

        abuffer_ctx = avfilter_graph_alloc_filter (
            filter_graph,
            abuffer,
            "src"
        );

        if (
            !abuffer_ctx
        ) {
            fprintf (
                stderr,
                "Could not allocate the abuffer instance.\n"
            );

            return AVERROR (
                ENOMEM
            );

        }

        /***********************************************************
        Set the filter options through the AVOptions API.
        ***********************************************************/
        av_channel_layout_describe (
            &INPUT_CHANNEL_LAYOUT,
            ch_layout,
            sizeof (
                ch_layout)
        );

        av_opt_set    (
            abuffer_ctx,
            "channel_layout",
            ch_layout,
            AV_OPT_SEARCH_CHILDREN
        );

        av_opt_set    (
            abuffer_ctx,
            "sample_fmt",
            av_get_sample_fmt_name (
                INPUT_FORMAT),
                AV_OPT_SEARCH_CHILDREN
        );

        av_opt_set_q  (
            abuffer_ctx,
            "time_base",
            new LibAVUtil.Rational () {
                numerator = 1,
                denominator = INPUT_SAMPLERATE
            },
            AV_OPT_SEARCH_CHILDREN
        );

        av_opt_set_int (
            abuffer_ctx,
            "sample_rate",
            INPUT_SAMPLERATE,
            AV_OPT_SEARCH_CHILDREN
        );

        /***********************************************************
        Now initialize the filter; we pass null options, since we have already
        set all the options above.
        ***********************************************************/
        err = avfilter_init_str (
            abuffer_ctx,
            null
        );

        if (
            err < 0
        ) {
            fprintf (
                stderr,
                "Could not initialize the abuffer filter.\n"
            );

            return err;
        }

        /***********************************************************
        Create volume filter.
        ***********************************************************/
        volume = avfilter_get_by_name (
            "volume"
        );

        if (
            !volume
        ) {
            fprintf (
                stderr,
                "Could not find the volume filter.\n"
            );

            return AVERROR_FILTER_NOT_FOUND;
        }

        volume_ctx = avfilter_graph_alloc_filter (
            filter_graph,
            volume,
            "volume"
        );

        if (
            !volume_ctx
        ) {
            fprintf (
                stderr,
                "Could not allocate the volume instance.\n"
            );

            return AVERROR (
                ENOMEM
            );

        }

        /***********************************************************
        A different way of passing the options is as key/value pairs in a
        dictionary.
        ***********************************************************/
        av_dict_set (
            &options_dict,
            "volume",
            AV_STRINGIFY (
                VOLUME_VAL),
                0
        );

        err = avfilter_init_dict (
            volume_ctx,
            &options_dict
        );

        av_dict_free (
            &options_dict
        );

        if (
            err < 0
        ) {
            fprintf (
                stderr,
                "Could not initialize the volume filter.\n"
            );

            return err;
        }

        /***********************************************************
        Create the aformat filter;
        it ensures that the output is of the format we want.
        ***********************************************************/
        aformat = avfilter_get_by_name (
            "aformat"
        );

        if (
            !aformat
        ) {
            fprintf (
                stderr,
                "Could not find the aformat filter.\n"
            );

            return AVERROR_FILTER_NOT_FOUND;
        }

        aformat_ctx = avfilter_graph_alloc_filter (
            filter_graph,
            aformat,
            "aformat"
        );

        if (
            !aformat_ctx
        ) {
            fprintf (
                stderr,
                "Could not allocate the aformat instance.\n"
            );

            return AVERROR (
                ENOMEM
            );

        }

        /***********************************************************
        A third way of passing the options is in a string of the form
        key1=value1:key2=value2....
        ***********************************************************/
        snprintf (
            options_str,
            sizeof (
                options_str),
                "sample_fmts=%s:sample_rates=%d:channel_layouts=stereo",
                av_get_sample_fmt_name (
                    LibAVUtil.SampleFormat.SIGNED_16_BIT),
                    44100
        );

        err = avfilter_init_str (
            aformat_ctx,
            options_str
        );

        if (
            err < 0
        ) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Could not initialize the aformat filter.\n"
            );

            return err;
        }

        /***********************************************************
        Finally create the abuffersink filter;
        it will be used to get the filtered data out of the graph.
        ***********************************************************/
        abuffersink = avfilter_get_by_name (
            "abuffersink"
        );

        if (
            !abuffersink
        ) {
            fprintf (
                stderr,
                "Could not find the abuffersink filter.\n"
            );

            return AVERROR_FILTER_NOT_FOUND;
        }

        abuffersink_ctx = avfilter_graph_alloc_filter (
            filter_graph,
            abuffersink,
            "sink"
        );

        if (
            !abuffersink_ctx
        ) {
            fprintf (
                stderr,
                "Could not allocate the abuffersink instance.\n"
            );

            return AVERROR (
                ENOMEM
            );

        }

        /***********************************************************
        This filter takes no options.
        ***********************************************************/
        err = avfilter_init_str (
            abuffersink_ctx,
            null
        );

        if (
            err < 0
        ) {
            fprintf (
                stderr,
                "Could not initialize the abuffersink instance.\n"
            );

            return err;
        }

        /***********************************************************
        Connect the filters;
        in this simple case the filters just form a linear chain.
        ***********************************************************/
        err = avfilter_link (
            abuffer_ctx,
            0,
            volume_ctx,
            0
        );

        if (
            err >= 0
        ) {
            err = avfilter_link (
            volume_ctx,
            0,
            aformat_ctx,
            0
            );

        }

        if (
            err >= 0
        ) {
            err = avfilter_link (
            aformat_ctx,
            0,
            abuffersink_ctx,
            0
            );

        }

        if (
            err < 0
        ) {
            fprintf (
                stderr,
                "Error connecting filters\n"
            );

            return err;
        }

        /***********************************************************
        Configure the graph.
        ***********************************************************/
        err = avfilter_graph_config (
            filter_graph,
            null
        );

        if (
            err < 0
        ) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Error configuring the filter graph\n"
            );

            return err;
        }

        graph_out = filter_graph;
        src_out = abuffer_ctx;
        sink_out = abuffersink_ctx;

        return 0;
    }

    /***********************************************************
    Do something useful with the filtered data: this simple
    example just prints the MD5 checksum of each plane to stdout.
    ***********************************************************/
    private static int process_output (
        AVMD5? md5,
        AVFrame? frame
    ) {
        int planar = av_sample_fmt_is_planar (
        frame.format
        );

        int channels = frame.ch_layout.nb_channels;
        int planes = planar ? channels : 1;
        int bps = av_get_bytes_per_sample (
            frame.format
        );

        int plane_size = bps * frame.nb_samples * (
            planar
            ? 1
            : channels
        );

        int i;
        int j;

        for (
            i = 0;
            i < planes;
            i++
        ) {
            uint8 checksum[16];

            av_md5_init (
                md5
            );

            av_md5_sum (
                checksum,
                frame.extended_data[i],
                plane_size
            );

            fprintf (
                stdout,
                "plane %d: 0x",
                i
            );

            for (
                j = 0;
                j < sizeof (
                    checksum
                );

                j++
            ) {
                fprintf (
                    stdout,
                    "%02X",
                    checksum[j]
                );

            }

            fprintf (
                stdout,
                "\n"
        );

        }

        fprintf (
            stdout,
            "\n"
        );

        return 0;
    }

    private const size_t FRAME_SIZE = 1024;

    /***********************************************************
    Construct a frame of audio data to be filtered;
    this simple example just synthesizes a sine wave.
    ***********************************************************/
    private static int get_input (
        AVFrame? frame,
        int frame_num
    ) {
        int err;
        int i;
        int j;

        /***********************************************************
        Set up the frame properties and allocate the buffer for the data.
        ***********************************************************/
        frame.sample_rate = INPUT_SAMPLERATE;
        frame.format = INPUT_FORMAT;
        av_channel_layout_copy (
            &frame.ch_layout,
            &INPUT_CHANNEL_LAYOUT
        );

        frame.nb_samples = FRAME_SIZE;
        frame.pts = frame_num * FRAME_SIZE;

        err = av_frame_get_buffer (
            frame,
            0
        );

        if (
            err < 0
        ) {
            return err;
        }

        /***********************************************************
        Fill the data for each channel.
        ***********************************************************/
        for (
            i = 0;
            i < 5;
            i++
        ) {
            float[] data = (
            float*)frame.extended_data[i];

            for (
                j = 0;
                j < frame.nb_samples;
                j++
            ) {
                data[j] = sin (
                    2 * M_PI * (
                        frame_num + j
                    ) * (
                        i + 1
                    ) / FRAME_SIZE
                );

            }

        }

        return 0;
    }

    private static int main (
        int argc,
        string[] argv
    ) {
        AVMD5? md5;
        AVFilterGraph? graph;
        AVFilterContext? src;
        AVFilterContext? sink;
        AVFrame? frame;
        float duration;
        int err;
        int nb_frames;
        int i;

        if (
            argc < 2
        ) {
            fprintf (
                stderr,
                "Usage: %s <duration>\n",
                argv[0]
            );

            return 1;
        }

        duration = atof (
            argv[1]
        );

        nb_frames = duration * INPUT_SAMPLERATE / FRAME_SIZE;
        if (
            nb_frames <= 0
        ) {
            fprintf (
                stderr,
                "Invalid duration: %s\n",
                argv[1]
            );

            return 1;
        }

        /***********************************************************
        Allocate the frame we will be using to store the data.
        ***********************************************************/
        frame = av_frame_alloc ();
        if (
            !frame
        ) {
            fprintf (
                stderr,
                "Error allocating the frame\n"
            );

            return 1;
        }

        md5 = av_md5_alloc ();
        if (
            !md5
        ) {
            av_frame_free (
                &frame
            );

            fprintf (
                stderr,
                "Error allocating the MD5 context\n"
            );

            return 1;
        }

        /***********************************************************
        Set up the filtergraph.
        ***********************************************************/
        err = init_filter_graph (
            &graph,
            &src,
            &sink
        );

        if (
            err < 0
        ) {
            av_frame_free (
                &frame
            );

            av_freep (
                &md5
            );

            fprintf (
                stderr,
                "Unable to init filter graph:"
            );

            return 1;
        }

        /***********************************************************
        the main filtering loop
        ***********************************************************/
        for (
            i = 0;
            i < nb_frames;
            i++
        ) {
            /***********************************************************
            get an input frame to be filtered
            ***********************************************************/
            err = get_input (
                frame,
                i
            );

            if (
                err < 0
            ) {
                fprintf (
                    stderr,
                    "Error generating input frame:"
                );

                throw new Goto.FAIL (
                    "");
            }

            /***********************************************************
            Send the frame to the input of the filtergraph.
            ***********************************************************/
            err = av_buffersrc_add_frame (
                src,
                frame
            );

            if (
                err < 0
            ) {
                av_frame_unref (
                    frame
                );

                fprintf (
                    stderr,
                    "Error submitting the frame to the filtergraph:"
                );

                throw new Goto.FAIL (
                    "");
            }

            /***********************************************************
            Get all the filtered output that is available.
            ***********************************************************/
            while (
                (err = av_buffersink_get_frame (
                    sink,
                    frame)) >= 0
            ) {
                /***********************************************************
                now do something with our filtered frame
                ***********************************************************/
                err = process_output (
                    md5,
                    frame
                );

                if (
                    err < 0
                ) {
                    fprintf (
                        stderr,
                        "Error processing the filtered frame:"
                    );

                    throw new Goto.FAIL (
                        ""
                    );

                }

                av_frame_unref (
                    frame
                );

            }

            if (
                err == AVERROR (
                    EAGAIN)
            ) {
                /***********************************************************
                Need to feed more frames in.
                ***********************************************************/
                continue;
            } else if (
                err == AVERROR_EOF
            ) {
                /***********************************************************
                Nothing more to do, finish.
                ***********************************************************/
                break;
            } else if (
                err < 0
            ) {
                /***********************************************************
                An error occurred.
                ***********************************************************/
                fprintf (
                    stderr,
                    "Error filtering the data:"
                );

                throw new Goto.FAIL (
                    "");
            }

        }

        avfilter_graph_free (
            &graph
        );

        av_frame_free (
            &frame
        );

        av_freep (
            &md5
        );

        return 0;

    //  fail:
        avfilter_graph_free (
            &graph
        );

        av_frame_free (
            &frame
        );

        av_freep (
            &md5
        );

        fprintf (
            stderr,
            "%s\n",
            av_err2str (
                err)
        );

        return 1;
    }

}

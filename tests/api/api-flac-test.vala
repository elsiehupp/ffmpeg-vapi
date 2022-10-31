/***********************************************************
@copyright 2015 Ludmila Glinskih
@copyright 2001 Fabrice Bellard

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
***********************************************************/


/***********************************************************
FLAC codec test.
Encodes raw data to FLAC format and decodes it back to raw. Compares raw-data
after that.
***********************************************************/


const uint NUMBER_OF_AUDIO_FRAMES = 200;
const uint NAME_BUFF_SIZE = 100;

/***********************************************************
generate i-th frame of test audio
***********************************************************/

static uint generate_raw_frame (
    out uint16[] frame_data,
    uint16 i,
    uint16 sample_rate,
    uint16 channels,
    uint16 frame_size
) {
    for (uint16 j = 0; j < frame_size; j++) {
        frame_data[channels * j] = 10000 * ((j / 10 * i) % 2);
        for (uint16 k = 1; k < channels; k++) {
            frame_data[channels * j + k] = frame_data[channels * j] * (k + 1);
        }
    }
    return 0;
}

static uint init_encoder (
    AVCodec *enc,
    AVCodecContext **enc_ctx,
    int64 ch_layout,
    uint sample_rate
) {
    AVCodecContext *ctx;
    uint result;
    char name_buff[NAME_BUFF_SIZE];

    av_get_channel_layout_string (name_buff, NAME_BUFF_SIZE, 0, ch_layout);
    av_log (
        null,
        AV_LOG_INFO,
        "channel layout: %s, sample rate: %i\n",
        name_buff,
        sample_rate
    );

    ctx = avcodec_alloc_context3 (enc);
    if (!ctx) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate encoder context\n"
        );
        return AVERROR (ENOMEM);
    }

    ctx.sample_fmt = AV_SAMPLE_FMT_S16;
    ctx.sample_rate = sample_rate;
    ctx.channel_layout = ch_layout;

    result = avcodec_open2 (ctx, enc, null);
    if (result < 0) {
        av_log (
            ctx,
            AV_LOG_ERROR,
            "Can't open encoder\n"
        );
        return result;
    }

    *enc_ctx = ctx;
    return 0;
}

static uint init_decoder (
    AVCodec *dec,
    AVCodecContext **dec_ctx,
    int64 ch_layout
) {
    AVCodecContext *ctx;
    uint result;

    ctx = avcodec_alloc_context3 (dec);
    if (!ctx) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate decoder context\n"
        );
        return AVERROR (ENOMEM);
    }

    ctx.request_sample_fmt = AV_SAMPLE_FMT_S16;
    /***********************************************************
    XXX: FLAC ignores it for some reason
***********************************************************/

    ctx.request_channel_layout = ch_layout;
    ctx.channel_layout = ch_layout;

    result = avcodec_open2 (ctx, dec, null);
    if (result < 0) {
        av_log (
            ctx,
            AV_LOG_ERROR,
            "Can't open decoder\n"
        );
        return result;
    }

    *dec_ctx = ctx;
    return 0;
}

static uint run_test (
    AVCodec *enc,
    AVCodec *dec,
    AVCodecContext *enc_ctx,
    AVCodecContext *dec_ctx
) {
    AVPacket enc_pkt;
    AVFrame in_frame;
    AVFrame out_frame;
    uint8[] raw_in = null;
    uint8[] raw_out = null;
    uint in_offset = 0, out_offset = 0;
    uint result = 0;
    uint got_output = 0;
    uint in_frame_bytes, out_frame_bytes;

    in_frame = av_frame_alloc ();
    if (!in_frame) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate input frame\n"
        );
        return AVERROR (ENOMEM);
    }

    in_frame.nb_samples = enc_ctx.frame_size;
    in_frame.format = enc_ctx.sample_fmt;
    in_frame.channel_layout = enc_ctx.channel_layout;
    if (av_frame_get_buffer (in_frame, 32) != 0) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate a buffer for input frame\n"
        );
        return AVERROR (ENOMEM);
    }

    out_frame = av_frame_alloc ();
    if (!out_frame) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate output frame\n"
        );
        return AVERROR (ENOMEM);
    }

    raw_in = av_malloc (in_frame.linesize[0] * NUMBER_OF_AUDIO_FRAMES);
    if (!raw_in) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate memory for raw_in\n"
        );
        return AVERROR (ENOMEM);
    }

    raw_out = av_malloc (in_frame.linesize[0] * NUMBER_OF_AUDIO_FRAMES);
    if (!raw_out) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't allocate memory for raw_out\n"
        );
        return AVERROR (ENOMEM);
    }

    for (uint i = 0; i < NUMBER_OF_AUDIO_FRAMES; i++) {
        av_init_packet (out enc_pkt);
        enc_pkt.data = null;
        enc_pkt.size = 0;

        generate_raw_frame ((uint16*)(in_frame.data[0]), i, enc_ctx.sample_rate,
                           enc_ctx.channels, enc_ctx.frame_size);
        in_frame_bytes = in_frame.nb_samples * in_frame.channels * sizeof (uint16);
        if (in_frame_bytes > in_frame.linesize[0]) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Incorrect value of input frame linesize\n"
            );
            return 1;
        }
        memcpy (raw_in + in_offset, in_frame.data[0], in_frame_bytes);
        in_offset += in_frame_bytes;
        result = avcodec_encode_audio2 (enc_ctx, out enc_pkt, in_frame, out got_output);
        if (result < 0) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Error encoding audio frame\n"
            );
            return result;
        }

        /***********************************************************
        If we get an encoded packet, feed it straight to the decoder
        ***********************************************************/

        if (got_output) {
            result = avcodec_decode_audio4 (dec_ctx, out_frame, out got_output, out enc_pkt);
            if (result < 0) {
                av_log (
                    null,
                    AV_LOG_ERROR,
                    "Error decoding audio packet\n"
                );
                return result;
            }

            if (got_output) {
                if (result != enc_pkt.size) {
                    av_log (
                        null,
                        AV_LOG_INFO,
                        "Decoder consumed only part of a packet, it is allowed to do so -- need to update this test\n"
                    );
                    return AVERROR_UNKNOWN;
                }

                if (in_frame.nb_samples != out_frame.nb_samples) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Error frames before and after decoding has different number of samples\n"
                    );
                    return AVERROR_UNKNOWN;
                }

                if (in_frame.channel_layout != out_frame.channel_layout) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Error frames before and after decoding has different channel layout\n"
                    );
                    return AVERROR_UNKNOWN;
                }

                if (in_frame.format != out_frame.format) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Error frames before and after decoding has different sample format\n"
                    );
                    return AVERROR_UNKNOWN;
                }
                out_frame_bytes = out_frame.nb_samples * out_frame.channels * sizeof (uint16);
                if (out_frame_bytes > out_frame.linesize[0]) {
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Incorrect value of output frame linesize\n"
                    );
                    return 1;
                }
                memcpy (raw_out + out_offset, out_frame.data[0], out_frame_bytes);
                out_offset += out_frame_bytes;
            }
        }
        av_packet_unref (out enc_pkt);
    }

    if (memcmp (raw_in, raw_out, out_frame_bytes * NUMBER_OF_AUDIO_FRAMES) != 0) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Output differs\n"
        );
        return 1;
    }

    av_log (
        null,
        AV_LOG_INFO,
        "OK\n"
    );

    av_freep (out raw_in);
    av_freep (out raw_out);
    av_frame_free (out in_frame);
    av_frame_free (out out_frame);
    return 0;
}

static uint close_encoder (AVCodecContext **enc_ctx) {
    avcodec_close (*enc_ctx);
    av_freep (enc_ctx);
    return 0;
}

static uint close_decoder (AVCodecContext **dec_ctx) {
    avcodec_close (*dec_ctx);
    av_freep (dec_ctx);
    return 0;
}

uint main () {
    AVCodec *enc = null;
    AVCodec *dec = null;
    AVCodecContext *enc_ctx = null;
    AVCodecContext *dec_ctx = null;
    uint64 channel_layouts[] = {
        AV_CH_LAYOUT_STEREO,
        AV_CH_LAYOUT_5POINT1_BACK,
        AV_CH_LAYOUT_SURROUND,
        AV_CH_LAYOUT_STEREO_DOWNMIX
    };
    uint sample_rates[] = {
        8000,
        44100,
        48000,
        192000
    };
    uint cl, sr;

    enc = avcodec_find_encoder (AV_CODEC_ID_FLAC);
    if (!enc) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't find encoder\n"
        );
        return 1;
    }

    dec = avcodec_find_decoder (AV_CODEC_ID_FLAC);
    if (!dec) {
        av_log (
            null,
            AV_LOG_ERROR,
            "Can't find decoder\n"
        );
        return 1;
    }

    for (cl = 0; cl < FF_ARRAY_ELEMS (channel_layouts); cl++) {
        for (sr = 0; sr < FF_ARRAY_ELEMS (sample_rates); sr++) {
            if (init_encoder (enc, out enc_ctx, channel_layouts[cl], sample_rates[sr]) != 0)
                return 1;
            if (init_decoder (dec, out dec_ctx, channel_layouts[cl]) != 0)
                return 1;
            if (run_test (enc, dec, enc_ctx, dec_ctx) != 0)
                return 1;
            close_encoder (out enc_ctx);
            close_decoder (out dec_ctx);
        }
    }

    return 0;
}

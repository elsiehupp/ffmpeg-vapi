/***********************************************************
Copyright (c) 2015 Stephan Holljes

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
@file libavformat multi-client network API usage example
@example avio_http_serve_files.c

Serve a file without decoding or demuxing it over the HTTP protocol. Multiple
clients can connect and will receive the same file.
***********************************************************/

//#include <libavformat/avformat.h>
//#include <libavutil/opt.h>
//#include <unistd.h>

private class AVIOHTTPServeFilesApplication : GLib.Application {

    private static void process_client (
        LibAVFormat.IOContext? client,
        string in_uri
    ) {
        LibAVFormat.IOContext? input = null;
        uint8 buf[1024];
        int ret;
        int n;
        int reply_code;
        uint8[] resource = null;
        while (
            (ret = avio_handshake (
                client)) > 0
        ) {
            av_opt_get (
                client,
                "resource",
                AV_OPT_SEARCH_CHILDREN,
                &resource
            );


            /***********************************************************
            check for strlen (resource) is necessary, because av_opt_get ()

            may return empty string.
            ***********************************************************/
            if (
                resource &&
                strlen (
                    resource)
            ) {
                break;
            }

            av_freep (
                &resource
            );

        }

        if (
            ret < 0
        ) {
            throw new Goto.END (
                ""
            );

        }

        av_log (
            client,
            AV_LOG_TRACE,
            "resource=%p\n",
            resource
        );

        if (
            resource &&
            resource[0] == '/' &&
            !strcmp (
                (
                    resource + 1
                ),
                in_uri
            )
        ) {
            reply_code = 200;
        } else {
            reply_code = AVERROR_HTTP_NOT_FOUND;
        }

        ret = av_opt_set_int (
            client,
            "reply_code",
            reply_code,
            AV_OPT_SEARCH_CHILDREN
        );

        if (
            ret < 0
        ) {
            av_log (
                client,
                AV_LOG_ERROR,
                "Failed to set reply_code: %s.\n",
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        av_log (
            client,
            AV_LOG_TRACE,
            "Set reply code to %d\n",
            reply_code
        );

        while (
            (ret = avio_handshake (
                client)) > 0
        );

        if (
            ret < 0
        ) {
            throw new Goto.END (
                ""
            );

        }

        fprintf (
            stderr,
            "Handshake performed.\n"
        );

        if (
            reply_code != 200
        ) {
            throw new Goto.END (
                ""
            );

        }

        fprintf (
            stderr,
            "Opening input file.\n"
        );

        ret = avio_open2 (
            &input,
            in_uri,
            LibAVFormat.IOOpenFlags.READ,
            null,
            null
        );

        if (
            ret < 0
        ) {
            av_log (
                input,
                AV_LOG_ERROR,
                "Failed to open input: %s: %s.\n",
                in_uri,
                av_err2str (
                    ret)
            );

            throw new Goto.END (
                ""
            );

        }

        for (
            ;
            ;
        ) {
            n = avio_read (
            input,
            buf,
            sizeof (
                buf)
            );

            if (
                n < 0
            ) {
                if (
                    n == AVERROR_EOF
                ) {
                    break;
                }

                av_log (
                    input,
                    AV_LOG_ERROR,
                    "Error reading from input: %s.\n",
                    av_err2str (
                        n)
                );

                break;
            }

            avio_write (
                client,
                buf,
                n
            );

            avio_flush (
                client
            );

        }

    //  end:
        fprintf (
            stderr,
            "Flushing client\n"
        );

        avio_flush (
            client
        );

        fprintf (
            stderr,
            "Closing client\n"
        );

        avio_close (
            client
        );

        fprintf (
            stderr,
            "Closing input\n"
        );

        avio_close (
            input
        );

        av_freep (
            &resource
        );

    }

    private static int main (
        int argc,
        string[] argv
    ) {
        LibAVUtil.Dictionary? options = null;
        LibAVFormat.IOContext? client = null;
        LibAVFormat.IOContext? server = null;
        string in_uri;
        string out_uri;
        int ret;
        int pid;
        av_log_set_level (
            AV_LOG_TRACE
        );

        if (
            argc < 3
        ) {
            printf (
                "usage: %s input http://hostname[:port]\n" +
                "API example program to serve http to multiple clients.\n" +
                "\n",
                argv[0]
            );

            return 1;
        }

        in_uri = argv[1];
        out_uri = argv[2];

        avformat_network_init ();

        ret = av_dict_set (
            &options,
            "listen",
            "2",
            0
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to set listen mode for server: %s\n",
                av_err2str (
                    ret)
            );

            return ret;
        }

        ret = avio_open2 (
            &server,
            out_uri,
            LibAVFormat.IOOpenFlags.WRITE,
            null,
            &options
        );

        if (
            ret < 0
        ) {
            fprintf (
                stderr,
                "Failed to open server: %s\n",
                av_err2str (
                    ret)
            );

            return ret;
        }

        fprintf (
            stderr,
            "Entering main loop.\n"
        );

        for (
            ;
            ;
        ) {
            ret = avio_accept (
            server,
            &client
            );

            if (
                ret < 0
            ) {
                throw new Goto.END (
                    ""
                );

            }

            fprintf (
                stderr,
                "Accepted client, forking process.\n"
            );


            /***********************************************************
            XXX: Since we don't reap our children and don't ignore signals
            this produces zombie processes.
            ***********************************************************/
            pid = fork ();
            if (
                pid < 0
            ) {
                perror (
                    "Fork failed"
                );

                ret = AVERROR (
                    errno
                );

                throw new Goto.END (
                    ""
                );

            }

            if (
                pid == 0
            ) {
                fprintf (
                    stderr,
                    "In child.\n"
                );

                process_client (
                    client,
                    in_uri
                );

                avio_close (
                    server
                );

                exit (
                    0
                );

            }

            if (
                pid > 0
            ) {
                avio_close (
                    client
                );

            }

        }

    //  end:
        avio_close (
            server
        );

        if (
            ret < 0 &&
            ret != AVERROR_EOF
        ) {
            fprintf (
                stderr,
                "Some errors occurred: %s\n",
                av_err2str (
                    ret)
            );

            return 1;
        }

        return 0;
    }

}

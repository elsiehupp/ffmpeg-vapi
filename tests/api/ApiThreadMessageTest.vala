/***********************************************************
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

public class ApiThreadMessageTest : GLib.TestCase {

    /***********************************************************
    Thread message API test
    ***********************************************************/
    abstract class AbstractData {
        public abstract string stringify ();
        public static uint count;
        public static uint min_load;
        public static uint max_load;
        public uint id;
        public GLib.Thread tid;
        public uint workload;
        public LibAVUtil.ThreadMessageQueue queue;
        public abstract void *thread ();

        public static void SPAWN_THREADS (LibAVUtil.ThreadMessageQueue queue) throws Goto {
            for (int i = 0; i < count; i++) {
                AbstractData td = instance_array[i];
        
                td.id = i;
                td.queue = queue;
                td.workload = get_workload (
                    min_load,
                    max_load
                );
        
                ret = pthread_create (
                    out td.tid,
                    null,
                    thread,
                    td
                );
                if (ret) {
                    uint err = AVERROR (ret);
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Unable to start " +
                        stringify () +
                        " thread: %s\n",
                        av_err2str (err)
                    );
                    throw new Goto.END ();
                }
            }
        }
        
        public static void WAIT_THREADS () throws Goto {
            for (uint i = 0; i < count; i++) {
                AbstractData *td = instance_array[i];
        
                ret = pthread_join (
                    td.tid,
                    null
                );
                if (ret) {
                    uint err = AVERROR (ret);
                    av_log (
                        null,
                        AV_LOG_ERROR,
                        "Unable to join " +
                        stringify () +
                        " thread: %s\n",
                        av_err2str (err)
                    );
                    throw new Goto.END ();
                }
            }
        }

        static uint get_workload (
            uint minv,
            uint maxv
        ) {
            return maxv == minv ? maxv : rand () % (maxv - minv) + minv;
        }
        
        
    }

    class SenderData : AbstractData {
        public static SenderData[] instance_array;
        public override string stringify () {
            return "SenderData";
        }
        public override void *thread () {
            uint ret = 0;
        
            av_log (
                null,
                AV_LOG_INFO,
                "sender #%d: workload=%d\n",
                this.id,
                this.workload
            );
            for (uint i = 0; i < this.workload; i++) {
                if (rand () % this.workload < this.workload / 10) {
                    av_log (
                        null,
                        AV_LOG_INFO,
                        "sender #%d: flushing the queue\n",
                        this.id
                    );
                    av_thread_message_flush (this.queue);
                } else {
                    char[] val;
                    LibAVUtil.Dictionary *meta = null;
                    ThreadMessage msg = new ThreadMessage () {
                        magic = MAGIC,
                        frame = av_frame_alloc (),
                    };
        
                    if (msg.frame == null) {
                        ret = AVERROR (ENOMEM);
                        break;
                    }
        
                    /***********************************************************
                    We add some metadata to identify the frames
                    ***********************************************************/
        
                    val = av_asprintf (
                        "frame %d/%d from sender %d",
                        i + 1,
                        this.workload,
                        this.id
                    );
                    if (val == null) {
                        av_frame_free (out msg.frame);
                        ret = AVERROR (ENOMEM);
                        break;
                    }
                    ret = av_dict_set (
                        out meta,
                        "sig",
                        val,
                        AV_DICT_DONT_STRDUP_VAL
                    );
                    if (ret < 0) {
                        av_frame_free (out msg.frame);
                        break;
                    }
                    msg.frame.metadata = meta;
        
                    /***********************************************************
                    Allocate a real frame in order to simulate "real" work
                    ***********************************************************/
        
                    msg.frame.format = AV_PIX_FMT_RGBA;
                    msg.frame.width = 320;
                    msg.frame.height = 240;
                    ret = av_frame_get_buffer (
                        msg.frame,
                        32
                    );
                    if (ret < 0) {
                        av_frame_free (out msg.frame);
                        break;
                    }
        
                    /***********************************************************
                    Push the frame in the common queue
                    ***********************************************************/
        
                    av_log (
                        null,
                        AV_LOG_INFO,
                        "sender #%d: sending my work (%d/%d frame:%p)\n",
                        this.id,
                        i + 1,
                        this.workload,
                        msg.frame
                    );
                    ret = av_thread_message_queue_send (
                        this.queue,
                        out msg,
                        0
                    );
                    if (ret < 0) {
                        av_frame_free (out msg.frame);
                        break;
                    }
                }
            }
            av_log (
                null,
                AV_LOG_INFO,
                "sender #%d: my work is done here (%s)\n",
                this.id,
                av_err2str (ret)
            );
            av_thread_message_queue_set_err_recv (
                this.queue,
                ret < 0 ? ret : AVERROR_EOF
            );
            return null;
        }
        
    }

    /***********************************************************
    same as SenderData but shuffled for testing purpose
    ***********************************************************/

    class ReceiverData : AbstractData {
        public static ReceiverData[] instance_array;
        public override string stringify () {
            return "ReceiverData";
        }
        public override void *thread () {
            uint ret = 0;
        
            for (uint i = 0; i < this.workload; i++) {
                if (rand () % this.workload < this.workload / 10) {
                    av_log (
                        null,
                        AV_LOG_INFO,
                        "receiver #%d: flushing the queue, " +
                        "discarding %d ThreadMessage (s)\n",
                        this.id,
                        av_thread_message_queue_nb_elems (this.queue)
                    );
                    av_thread_message_flush (this.queue);
                } else {
                    ThreadMessage msg;
                    LibAVUtil.Dictionary *meta;
                    LibAVUtil.DictionaryEntry *e;
        
                    ret = av_thread_message_queue_recv (
                        this.queue,
                        out msg,
                        0
                    );
                    if (ret < 0)
                        break;
                    av_assert0 (msg.magic == MAGIC);
                    meta = msg.frame.metadata;
                    e = av_dict_get (
                        meta,
                        "sig",
                        null,
                        0
                    );
                    av_log (
                        null,
                        AV_LOG_INFO,
                        "got \"%s\" (%p)\n",
                        e.value,
                        msg.frame
                    );
                    av_frame_free (out msg.frame);
                }
            }
        
            av_log (
                null,
                AV_LOG_INFO,
                "consumed enough (%d), stop\n",
                i
            );
            av_thread_message_queue_set_err_send (
                this.queue,
                ret < 0 ? ret : AVERROR_EOF
            );
        
            return null;
        }
        
    }

    public class ThreadMessage {
        public LibAVUtil.Frame frame;
        // we add some junk in the ThreadMessage to make sure the ThreadMessage size is > sizeof (void*)
        public uint magic;

        //  static void free_frame
        ~ThreadMessage () {
            av_assert0 (msg.magic == MAGIC);
            av_frame_free (out msg.frame);
        }
        
    }

    const uint64 MAGIC = 0xdeadc0de;

    static uint end (Goto ret) {
        av_thread_message_queue_free (out queue);
        av_freep (SenderData.instance_array);
        av_freep (ReceiverData.instance_array);

        if (ret < 0 && ret != AVERROR_EOF) {
            av_log (
                null,
                AV_LOG_ERROR,
                "Error: %s\n",
                av_err2str (ret)
            );
            return 1;
        }
        return 0;
    }

    static uint main (
        uint ac,
        string[] av
    ) {
        uint ret = 0;
        uint max_queue_size;
        LibAVUtil.ThreadMessageQueue queue = null;

        if (ac != 8) {
            av_log (
                null,
                AV_LOG_ERROR,
                "%s <max_queue_size> " +
                "<SenderData.count> <sender_min_send> <sender_max_send> " +
                "<ReceiverData.count> <receiver_min_recv> <receiver_max_recv>\n",
                av[0]
            );
            return 1;
        }

        max_queue_size = atoi (av[1]);
        SenderData.count = atoi (av[2]);
        SenderData.min_load = atoi (av[3]);
        SenderData.max_load = atoi (av[4]);
        ReceiverData.count = atoi (av[5]);
        ReceiverData.min_load = atoi (av[6]);
        ReceiverData.max_load = atoi (av[7]);

        if (max_queue_size <= 0 ||
            SenderData.count <= 0 || SenderData.min_load <= 0 || SenderData.max_load <= 0 ||
            ReceiverData.count <= 0 || ReceiverData.min_load <= 0 || ReceiverData.max_load <= 0) {
            av_log (
                null,
                AV_LOG_ERROR,
                "negative values not allowed\n"
            );
            return 1;
        }

        av_log (
            null,
            AV_LOG_INFO,
            "qsize:%d / %d SenderData.instance_array sending [%d-%d] / " +
            "%d ReceiverData.instance_array receiving [%d-%d]\n",
            max_queue_size,
            SenderData.count,
            SenderData.min_load,
            SenderData.max_load,
            ReceiverData.count,
            ReceiverData.min_load,
            ReceiverData.max_load
        );

        SenderData.instance_array = av_mallocz_array (
            SenderData.count,
            sizeof (SenderData.instance_array)
        );
        ReceiverData.instance_array = av_mallocz_array (
            ReceiverData.count,
            sizeof (ReceiverData.instance_array)
        );
        if (!SenderData.instance_array || !ReceiverData.instance_array) {
            ret = AVERROR (ENOMEM);
            throw new Goto.END ();
        }

        ret = av_thread_message_queue_alloc (
            out queue,
            max_queue_size,
            sizeof (ThreadMessage)
        );
        if (ret < 0)
            throw new Goto.END ();

        av_thread_message_queue_set_free_func (
            queue,
            free_frame
        );


        try {
            SPAWN_THREADS (receiver);
            SPAWN_THREADS (sender);

            WAIT_THREADS (sender);
            WAIT_THREADS (receiver);
        } catch (Goto ret) {
            end (ret);
        }
        end (ret);
    }

}

/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

public delegate void ThreadMessageFreeDelegate (
    void *msg
);

[CCode (cname="struct AVThreadMessageQueue", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
public struct ThreadMessageQueue {
    /***********************************************************
    @brief Allocate a new message queue.

    @param mq pointer to the message queue
    @param nelem maximum number of elements in the queue
    @param elsize size of each element in the queue
    @return  >=0 for success; <0 for error, in particular LibAVUtil.ErrorCode (ENOSYS) if
        lavu was built without thread support
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_alloc", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public int av_thread_message_queue_alloc (
        ThreadMessageQueue mq,
        uint nelem,
        uint elsize
    );

    /***********************************************************
    @brief Free a message queue.

    The message queue must no longer be in use by another thread.
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_free", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public void av_thread_message_queue_free (
        ThreadMessageQueue mq
    );

    /***********************************************************
    @brief Send a message on the queue.
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_send", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public int av_thread_message_queue_send (
        ThreadMessageQueue mq,
        void *msg,
        uint flags
    );

    /***********************************************************
    @brief Receive a message from the queue.
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_recv", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public int av_thread_message_queue_recv (
        ThreadMessageQueue mq,
        void *msg,
        uint flags
    );

    /***********************************************************
    @brief Set the sending error code.

    If the error code is set to non-zero, av_thread_message_queue_send () will
    return it immediately. Conventional values, such as AVERROR_EOF or
    LibAVUtil.ErrorCode (EAGAIN), can be used to cause the sending thread to stop or
    suspend its operation.
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_set_err_send", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public void av_thread_message_queue_set_err_send (
        ThreadMessageQueue mq,
        int err
    );

    /***********************************************************
    @brief Set the receiving error code.

    If the error code is set to non-zero, av_thread_message_queue_recv () will
    return it immediately when there are no longer available messages.
    Conventional values, such as AVERROR_EOF or LibAVUtil.ErrorCode (EAGAIN), can be used
    to cause the receiving thread to stop or suspend its operation.
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_set_err_recv", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public void av_thread_message_queue_set_err_recv (
        ThreadMessageQueue mq,
        int err
    );

    /***********************************************************
    @brief Set the optional free message callback function which will be called if an
    operation is removing messages from the queue.
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_set_free_func", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public void av_thread_message_queue_set_free_func (
        ThreadMessageQueue mq,
        ThreadMessageFreeDelegate free_func
    );

    /***********************************************************
    @brief Return the current number of messages in the queue.

    @return the current number of messages or LibAVUtil.ErrorCode (ENOSYS) if lavu was built
        without thread support
    ***********************************************************/
    [CCode (cname="av_thread_message_queue_nb_elems", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public int av_thread_message_queue_nb_elems (
        ThreadMessageQueue mq
    );

    /***********************************************************
    @brief Flush the message queue

    This function is mostly equivalent to reading and free-ing every message
    except that it will be done in a single operation (no lock/unlock between
    reads).
    ***********************************************************/
    [CCode (cname="av_thread_message_flush", cheader_filename="ffmpeg/libavutil/threadmessage.h")]
    public void av_thread_message_flush (
        ThreadMessageQueue mq
    );

}

} // namespace LibAVUtil

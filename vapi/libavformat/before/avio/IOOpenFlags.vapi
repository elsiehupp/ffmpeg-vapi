/***********************************************************
@copyright 2001 Fabrice Bellard
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

/***********************************************************
@file @ingroup lavf_io
Buffered I/O operations
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
public enum LibAVFormat.IOOpenFlags {
    /***********************************************************
    @name URL open modes
    The flags argument to avio_open must be one of the following
    constants, optionally ORed with other flags.
    @{
    ***********************************************************/

    /***********************************************************
    @brief Read-only
    ***********************************************************/
    [CCode (cname="AVIO_FLAG_READ")]
    READ,

    /***********************************************************
    @brief Write-only
    ***********************************************************/
    [CCode (cname="AVIO_FLAG_WRITE")]
    WRITE,

    /***********************************************************
    @brief Read-write pseudo flag
    ***********************************************************/
    [CCode (cname="AVIO_FLAG_READ_WRITE")]
    READ_WRITE,

    /***********************************************************
    @}
    ***********************************************************/

    /***********************************************************
    Use non-blocking mode.
    If this flag is set, operations on the context will return
    LibAVUtil.ErrorCode (EAGAIN) if they can not be performed immediately.
    If this flag is not set, operations on the context will never return
    LibAVUtil.ErrorCode (EAGAIN).
    Note that this flag does not affect the opening/connecting of the
    context. Connecting a protocol will always block if necessary (e.g. on
    network protocols) but never hang (e.g. on busy devices).
    Warning: non-blocking protocols is work-in-progress; this flag may be
    silently ignored.
    ***********************************************************/
    [CCode (cname="AVIO_FLAG_NONBLOCK")]
    NON_BLOCKING,

    /***********************************************************
    Use direct mode.
    avio_read and avio_write should if possible be satisfied directly
    instead of going through a buffer, and avio_seek will always
    call the underlying seek function directly.
    ***********************************************************/
    [CCode (cname="AVIO_FLAG_DIRECT")]
    DIRECT;

    /***********************************************************
    @brief Return LibAVFormat.IOOpenFlags.* access flags corresponding to the access permissions
    of the resource in url, or a negative value corresponding to an
    LibAVUtil.ErrorCode code in case of failure. The returned access flags are
    masked by the value in flags.

    @note This function is intrinsically unsafe, in the sense that the
    checked resource may change its existence or permission status from
    one call to another. Thus you should not trust the returned value,
    unless you are sure that no other processes are accessing the
    checked resource.
    ***********************************************************/
    [CCode (cname="avio_check",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
    public LibAVFormat.IOOpenFlags avio_check (
        string url,
        int flags
    );

}

} // namespace LibAVFormat

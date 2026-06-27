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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
public delegate int InterruptCallbackDelegate (
    void *opaque
);

/***********************************************************
@brief Callback for checking whether to abort blocking functions.
LibAVUtil.ErrorCode.EXIT is returned in this case by the interrupted
function. During blocking operations, callback is called with
opaque as parameter. If the callback returns 1, the
blocking operation will be aborted.

No members can be added to this struct without a major bump, if
new elements have been added after this struct in LibAVFormat.FormatContext
or AVIOContext.
***********************************************************/
[CCode (cname="struct AVIOInterruptCB",cheader_filename="subprojects/ffmpeg/libformat/avio.h")]
[Compact]
public class AVIOInterruptCB {
    [CCode (cname="")]
    public InterruptCallbackDelegate callback;

    [CCode (cname="")]
    public void *opaque;
}

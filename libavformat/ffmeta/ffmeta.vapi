/***********************************************************
Common data for metadata muxer/demuxer
@copyright 2010 Anton Khirnov
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

[CCode (cname="ID_STRING", cheader="")]
public const string ID_STRING; // ";FFMETADATA"

[CCode (cname="ID_CHAPTER", cheader="")]
public const string ID_CHAPTER; // "[CHAPTER]"

[CCode (cname="ID_STREAM", cheader="")]
public const string ID_STREAM; // "[STREAM]"

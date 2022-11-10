/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

/***********************************************************
@file Public dictionary API.
@deprecated
LibAVUtil.Dictionary is provided for compatibility with libav. It is both in
implementation as well as API inefficient. It does not scale and is
extremely slow with large dictionaries.
It is recommended that new code uses our tree container from tree.c/h
where applicable, which uses AVL trees to achieve O (log n) performance.
***********************************************************/

[CCode (cname="struct AVDictionaryEntry", cheader_filename="dict.h")]
public struct DictionaryEntry {
    [CCode (cname="key")]
    public string key;
    [CCode (cname="key")]
    public string value;
}

} // namespace LibAVUtil

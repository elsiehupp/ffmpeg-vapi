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
@file
Public dictionary API.
@deprecated
LibAVUtil.Dictionary is provided for compatibility with libav. It is both in
implementation as well as API inefficient. It does not scale and is
extremely slow with large dictionaries.
It is recommended that new code uses our tree container from tree.c/h
where applicable, which uses AVL trees to achieve O (log n) performance.
***********************************************************/

/***********************************************************
@addtogroup lavu_dict LibAVUtil.Dictionary
@ingroup LibAVUtil.Data

@brief Simple key:value store

Dictionaries are used for storing key:value pairs. To create
an LibAVUtil.Dictionary, simply pass an address of a null pointer to
av_dict_set (). null can be used as an empty dictionary wherever
a pointer to an LibAVUtil.Dictionary is required.
Use av_dict_get () to retrieve an entry or iterate over all
entries and finally av_dict_free () to free the dictionary
and all its contents.

@code
LibAVUtil.Dictionary d = null; // "create" an empty dictionary
AVDictionaryEntry t = null;

av_dict_set (&d, "foo", "bar", 0); // add an entry

string k = av_strdup ("key"); // if your strings are already allocated,
string v = av_strdup ("value"); // you can avoid copying them like this
av_dict_set (&d, k, v, AVDictionaryFlags.DONT_STRDUP_KEY | AVDictionaryFlags.DONT_STRDUP_VAL);

while (t = av_dict_get (d, "", t, AVDictionaryFlags.IGNORE_SUFFIX)) {
    <....>        // iterate over all entries in d
}
av_dict_free (&d);
@endcode
***********************************************************/
[CCode (cprefix="AV_DICT_", cheader_filename="dict.h")]
public enum AVDictionaryFlags {
    /***********************************************************
    @brief Only get an entry with exact-case key match. Only relevant
    in av_dict_get ().
    ***********************************************************/
    MATCH_CASE,
    /***********************************************************
    @brief Return first entry in a dictionary whose first part
    corresponds to the search key, ignoring the suffix of the
    found key string. Only relevant in av_dict_get ().
    ***********************************************************/
    IGNORE_SUFFIX,
    /***********************************************************
    @brief Take ownership of a key that's been allocated with
    av_malloc () or another memory allocation function.
    ***********************************************************/
    DONT_STRDUP_KEY,
    /***********************************************************
    @brief Take ownership of a value that's been allocated with
    av_malloc () or another memory allocation function.
    ***********************************************************/
    DONT_STRDUP_VAL,
    /***********************************************************
    @brief Don't overwrite existing entries.
    ***********************************************************/
    DONT_OVERWRITE,
    /***********************************************************
    @brief If the entry already exists, append to it. Note that no
    delimiter is added, the strings are simply concatenated.
    ***********************************************************/
    APPEND,
    /***********************************************************
    @brief Allow to store several equal keys in the dictionary
    ***********************************************************/
    MULTIKEY,
}

} // namespace LibAVUtil

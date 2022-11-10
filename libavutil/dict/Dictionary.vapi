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

[CCode (cname="struct AVDictionary", cheader_filename="dict.h")]
public struct Dictionary  {
    /***********************************************************
    @brief Get a dictionary entry with matching key.

    The returned entry key or value must not be changed, or it will
    cause undefined behavior.

    To iterate through all the dictionary entries, you can set
    the matching key to the null string "" and set the
    AVDictionaryFlags.IGNORE_SUFFIX flag.

    @param prev Set to the previous matching element to find
        the next. If set to null the first matching element is
        returned.
    @param key matching key
    @param flags a collection of AVDictionaryFlags flags controlling how
        the entry is retrieved
    @return found entry or null in case no matching entry was
        found in the dictionary
    ***********************************************************/
    [CCode (cname="av_dict_get", cheader_filename="dict.h")]
    public LibAVUtil.DictionaryEntry av_dict_get (
        LibAVUtil.Dictionary dictionary,
        string key,
        LibAVUtil.DictionaryEntry prev,
        int flags
    );

    /***********************************************************
    @brief Get number of entries in dictionary.

    @param dictionary dictionary
    @return number of entries in dictionary
    ***********************************************************/
    [CCode (cname="av_dict_count", cheader_filename="dict.h")]
    public int av_dict_count (
        LibAVUtil.Dictionary dictionary
    );

    /***********************************************************
    @brief Set the given entry in pm, overwriting an existing entry.

    @note If AVDictionaryFlags.DONT_STRDUP_KEY or AVDictionaryFlags.DONT_STRDUP_VAL is set,
        these arguments will be freed on error.

    @warning Adding a new entry to a dictionary invalidates all existing entries
    previously returned with av_dict_get.

    @param pm pointer to a pointer to a dictionary struct. If pm is null
        a dictionary struct is allocated and put in pm.
    @param key entry key to add to pm (will either be av_strduped or added as a new key depending on flags)
    @param value entry value to add to pm (will be av_strduped or added as a new key depending on flags).
        Passing a null value will cause an existing entry to be deleted.
    @return >= 0 on success otherwise an error code <0
    ***********************************************************/
    [CCode (cname="av_dict_set", cheader_filename="dict.h")]
    public int av_dict_set (
        LibAVUtil.Dictionary pm,
        string key,
        string value,
        int flags
    );

    /***********************************************************
    @description Convenience wrapper for av_dict_set that converts the value to a string
        and stores it.

    @note If AVDictionaryFlags.DONT_STRDUP_KEY is set, key will be freed on error.
    ***********************************************************/
    [CCode (cname="av_dict_set_int", cheader_filename="dict.h")]
    public int av_dict_set_int (
        LibAVUtil.Dictionary pm,
        string key,
        int64 value,
        int flags
    );

    /***********************************************************
    @brief Parse the key/value pairs list and add the parsed entries to a dictionary.

    In case of failure, all the successfully set entries are stored in
    *pm. You may need to manually free the created dictionary.

    @param key_val_sep a 0-terminated list of characters used to separate
        key from value
    @param pairs_sep a 0-terminated list of characters used to separate
        two pairs from each other
    @param flags flags to use when adding to dictionary.
        AVDictionaryFlags.DONT_STRDUP_KEY and AVDictionaryFlags.DONT_STRDUP_VAL
        are ignored since the key/value tokens will always
        be duplicated.
    @return 0 on success, negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="av_dict_parse_string", cheader_filename="dict.h")]
    public int av_dict_parse_string (
        LibAVUtil.Dictionary pm,
        string str,
        string key_val_sep,
        string pairs_sep,
        int flags
    );

    /***********************************************************
    @brief Copy entries from one LibAVUtil.Dictionary struct into another.
    @param output_dictionary pointer to a pointer to a LibAVUtil.Dictionary struct. If output_dictionary is null,
        this function will allocate a struct for you and put it in output_dictionary
    @param input_dictionary pointer to source LibAVUtil.Dictionary struct
    @param flags flags to use when setting entries in output_dictionary
    @note metadata is read using the AVDictionaryFlags.IGNORE_SUFFIX flag
    @return 0 on success, negative LibAVUtil.ErrorCode code on failure. If output_dictionary was allocated
        by this function, callers should free the associated memory.
    ***********************************************************/
    [CCode (cname="av_dict_copy", cheader_filename="dict.h")]
    public int av_dict_copy (
        LibAVUtil.Dictionary output_dictionary,
        LibAVUtil.Dictionary input_dictionary,
        int flags
    );

    /***********************************************************
    @description Free all the memory allocated for an LibAVUtil.Dictionary struct
        and all keys and values.
    ***********************************************************/
    [CCode (cname="av_dict_free", cheader_filename="dict.h")]
    public void av_dict_free (
        LibAVUtil.Dictionary dictionary
    );

    /***********************************************************
    @brief Get dictionary entries as a string.

    @description Create a string containing dictionary's entries.
        Such string may be passed back to av_dict_parse_string ().

    @note String is escaped with backslashes ('\').

    @param[in] dictionary dictionary
    @param[out] buffer Pointer to buffer that will be allocated with string containg entries.
        Buffer must be freed by the caller when is no longer needed.
    @param[in] key_val_sep character used to separate key from value
    @param[in] pairs_sep character used to separate two pairs from each other
    @return        >= 0 on success, negative on error
    @warning Separators cannot be neither '\\' nor '\0'. They also cannot be the same.
    ***********************************************************/
    [CCode (cname="av_dict_get_string", cheader_filename="dict.h")]
    public int av_dict_get_string (
        LibAVUtil.Dictionary dictionary,
        string buffer,
        char key_val_sep,
        char pairs_sep
    );
}

} // namespace LibAVUtil

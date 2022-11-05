/***********************************************************
Cyril Comparon, Larbi Joubala, Resonate-MP4 2009

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

/***********************************************************
Known language codespaces
***********************************************************/
public enum AVLangCodespace {
    /***********************************************************
    3-char bibliographic language codes as per ISO-IEC 639-2
    ***********************************************************/
    AV_LANG_ISO639_2_BIBL,
    /***********************************************************
    3-char terminological language codes as per ISO-IEC 639-2
    ***********************************************************/
    AV_LANG_ISO639_2_TERM,
    /***********************************************************
    2-char code of language as per ISO/IEC 639-1
    ***********************************************************/
    AV_LANG_ISO639_1
}

/***********************************************************
Convert a language code to a target codespace. The source codespace is guessed.
@return NULL if the provided lang is null or invalid.
***********************************************************/
string ff_convert_lang_to (
    string lang,
    AVLangCodespace target_codespace
);

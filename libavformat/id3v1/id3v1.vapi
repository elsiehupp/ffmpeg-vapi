/***********************************************************
ID3v1 header parser
Copyright (c) 2003 Fabrice Bellard

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

public const size_t ID3v1_TAG_SIZE;

public const size_t ID3v1_GENRE_MAX;

/***********************************************************
ID3v1 genres
***********************************************************/
//  extern string const ff_id3v1_genre_str[ID3v1_GENRE_MAX + 1];

/***********************************************************
Read an ID3v1 tag
***********************************************************/
void ff_id3v1_read(AVFormatContext *s);

/***********************************************************
Version macros.

This file is part of libswresample

libswresample is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

libswresample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with libswresample; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
Libswresample version macros
***********************************************************/

[CCode (cname="",cheader_filename="")]
public define LIBSWRESAMPLE_VERSION_MAJOR   3
public define LIBSWRESAMPLE_VERSION_MINOR   5
public define LIBSWRESAMPLE_VERSION_MICRO 100

[CCode (cname="",cheader_filename="")]
public define LIBSWRESAMPLE_VERSION_INT  AV_VERSION_INT (LIBSWRESAMPLE_VERSION_MAJOR, \
                                                  LIBSWRESAMPLE_VERSION_MINOR, \
                                                  LIBSWRESAMPLE_VERSION_MICRO)
public define LIBSWRESAMPLE_VERSION      AV_VERSION (LIBSWRESAMPLE_VERSION_MAJOR, \
                                              LIBSWRESAMPLE_VERSION_MINOR, \
                                              LIBSWRESAMPLE_VERSION_MICRO)
public define LIBSWRESAMPLE_BUILD        LIBSWRESAMPLE_VERSION_INT

[CCode (cname="",cheader_filename="")]
public define LIBSWRESAMPLE_IDENT        "SwR" AV_STRINGIFY (LIBSWRESAMPLE_VERSION)

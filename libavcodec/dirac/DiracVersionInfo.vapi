/***********************************************************
@copyright 2007 Marco Gerards <marco@gnu.org>
@copyright 2009 David Conrad
@copyright 2011 Jordi Ortiz

This file is part of FFmpeg.

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
Interface to Dirac Decoder/Encoder
@author Marco Gerards <marco@gnu.org>
@author David Conrad
@author Jordi Ortiz
***********************************************************/

/***********************************************************
@brief Parse code values:

Dirac Specification ->
9.6.1 Table 9.1

VC-2 Specification ->
10.4.1 Table 10.1
***********************************************************/

[CCode (cname="struct DiracVersionInfo", cheader_filename="ffmpeg/libavcodec/dirac.h")]
public struct DiracVersionInfo {
    [CCode (cname="major")]
    public int major;
    [CCode (cname="minor")]
    public int minor;
}

} // namespace LibAVCodec

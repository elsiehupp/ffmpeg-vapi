/***********************************************************
@brief RTMP definitions
@copyright 2009 Konstantin Shishkov
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

[CCode (cname="", cheader_filename="")]
public const int RTMP_DEFAULT_PORT; // 1935
[CCode (cname="", cheader_filename="")]
public const int RTMPS_DEFAULT_PORT; // 443

[CCode (cname="", cheader_filename="")]
public const size_t RTMP_HANDSHAKE_PACKET_SIZE; // 1536

/***********************************************************
@brief Emulated Flash client version - 9.0.124.2 on Linux

version defines
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const string RTMP_CLIENT_PLATFORM; // "LNX"
[CCode (cname="", cheader_filename="")]
public const int RTMP_CLIENT_VER1; // 9
[CCode (cname="", cheader_filename="")]
public const int RTMP_CLIENT_VER2; // 0
[CCode (cname="", cheader_filename="")]
public const int RTMP_CLIENT_VER3; // 124
[CCode (cname="", cheader_filename="")]
public const int RTMP_CLIENT_VER4; // 2

/***********************************************************
@brief Calculate HMAC-SHA2 digest for RTMP handshake packets.

@param src input buffer
@param len input buffer length (should be 1536)
@param gap offset in buffer where 32 bytes should not be taken into account
    when calculating digest (since it will be used to store that digest)
@param key digest key
@param keylen digest key length
@param dst buffer where calculated digest will be stored (32 bytes)
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtmp_calc_digest (
    uint8[] src,
    int len,
    int gap,
    uint8[] key,
    int keylen,
    uint8[] dst
);

/***********************************************************
@brief Calculate digest position for RTMP handshake packets.

@param buffer input buffer (should be 1536 bytes)
@param off offset in buffer where to start calculating digest position
@param mod_val value used for computing modulo
@param add_val value added at the end (after computing modulo)
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtmp_calc_digest_pos (
    uint8[] buffer,
    int off,
    int mod_val,
    int add_val
);

} // namespace LibAVFormat

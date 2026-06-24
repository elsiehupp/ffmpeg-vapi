/***********************************************************
@brief SRTP encryption/decryption
@copyright 2012 Martin Storsjo
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

[CCode (cname="struct SRTPContext",cheader_filename="subprojects/ffmpeg/libformat/srtp.h")]
[Compact]
public class SRTPContext {
    [CCode (cname="")]
    public LibAVUtil.Crypto.AESContext aes;

    [CCode (cname="")]
    public LibAVUtil.Crypto.HMACContext hmac;

    [CCode (cname="")]
    public int rtp_hmac_size;

    [CCode (cname="")]
    public int rtcp_hmac_size;

    [CCode (cname="")]
    public uint8 master_key[16];

    [CCode (cname="")]
    public uint8 master_salt[14];

    [CCode (cname="")]
    public uint8 rtp_key[16];

    [CCode (cname="")]
    public uint8 rtcp_key[16];

    [CCode (cname="")]
    public uint8 rtp_salt[14];

    [CCode (cname="")]
    public uint8 rtcp_salt[14];

    [CCode (cname="")]
    public uint8 rtp_auth[20];

    [CCode (cname="")]
    public uint8 rtcp_auth[20];

    [CCode (cname="")]
    public int seq_largest;

    [CCode (cname="")]
    public int seq_initialized;

    [CCode (cname="")]
    public uint32 roc;

    [CCode (cname="")]
    public uint32 rtcp_index;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/srtp.h")]
public int ff_srtp_set_crypto (
    SRTPContext srtp_context,
    string suite,
    string params
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/srtp.h")]
public void ff_srtp_free (
    SRTPContext srtp_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/srtp.h")]
public int ff_srtp_decrypt (
    SRTPContext srtp_context,
    uint8[] buffer,
    out int lenptr
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/srtp.h")]
public int ff_srtp_encrypt (
    SRTPContext srtp_context,
    uint8[] input_buffer,
    int len,
    out uint8[] output_buffer,
    int outlen
);

} // namespace LibAVFormat

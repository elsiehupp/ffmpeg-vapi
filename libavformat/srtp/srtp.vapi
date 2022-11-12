/***********************************************************
SRTP encryption/decryption
@copyright 2012 Martin Storsjo
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

namespace LibAVFormat {

[CCode (cname="struct SRTPContext", cheader_filename="")]
public struct SRTPContext {
    public LibAVUtil.Crypto.AESContext aes;
    public LibAVUtil.Crypto.HMACContext hmac;
    public int rtp_hmac_size;
    public int rtcp_hmac_size;
    public uint8 master_key[16];
    public uint8 master_salt[14];
    public uint8 rtp_key[16];
    public uint8 rtcp_key[16];
    public uint8 rtp_salt[14];
    public uint8 rtcp_salt[14];
    public uint8 rtp_auth[20];
    public uint8 rtcp_auth[20];
    public int seq_largest;
    public int seq_initialized;
    public uint32 roc;

    public uint32 rtcp_index;
}

[CCode (cname="", cheader_filename="")]
public int ff_srtp_set_crypto (
    SRTPContext srtp_context,
    string suite,
    string params
);

[CCode (cname="", cheader_filename="")]
public void ff_srtp_free (
    SRTPContext srtp_context
);

[CCode (cname="", cheader_filename="")]
public int ff_srtp_decrypt (
    SRTPContext srtp_context,
    uint8[] buffer,
    out int lenptr
);

[CCode (cname="", cheader_filename="")]
public int ff_srtp_encrypt (
    SRTPContext srtp_context,
    uint8[] input_buffer,
    int len,
    out uint8[] output_buffer,
    int outlen
);

} // namespace LibAVFormat

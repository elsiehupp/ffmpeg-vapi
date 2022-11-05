/***********************************************************
SRTP encryption/decryption
Copyright (c) 2012 Martin Storsjo

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

public struct SRTPContext {
    LibAVUtil.Crypto.AESContext *aes;
    LibAVUtil.Crypto.HMACContext *hmac;
    int rtp_hmac_size;
    int rtcp_hmac_size;
    uint8 master_key[16];
    uint8 master_salt[14];
    uint8 rtp_key[16];
    uint8 rtcp_key[16];
    uint8 rtp_salt[14];
    uint8 rtcp_salt[14];
    uint8 rtp_auth[20];
    uint8 rtcp_auth[20];
    int seq_largest;
    int seq_initialized;
    uint32 roc;

    uint32 rtcp_index;
}

int ff_srtp_set_crypto (
    SRTPContext *s,
    string suite,
    string params
);
void ff_srtp_free (
    SRTPContext *s
);
int ff_srtp_decrypt (
    SRTPContext *s,
    uint8[] buf,
    out int lenptr
);
int ff_srtp_encrypt (
    SRTPContext *s,
    uint8[] input_buffer,
    int len,
    out uint8[] output_buffer,
    int outlen
);

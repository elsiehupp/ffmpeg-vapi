/***********************************************************
@brief RTMPE encryption utilities
@copyright 2012 Samuel Pitoiset
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

/***********************************************************
@brief Initialize the Diffie-Hellmann context and generate the public key.

@param h an URLContext
@param buffer handshake data (1536 bytes)
@return zero on success, negative value otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtmpe_gen_pub_key (
    URLContext url_context,
    uint8[] buffer
);

/***********************************************************
@brief Compute the shared secret key and initialize the RC4 encryption.

@param h an URLContext
@param serverdata server data (1536 bytes)
@param clientdata client data (1536 bytes)
@param type the position of the server digest
@return zero on success, negative value otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtmpe_compute_secret_key (
    URLContext url_context,
    uint8[] serverdata,
    uint8[] clientdata,
    int type
);

/***********************************************************
@brief Encrypt the signature.

@param h an URLContext
@param signature the signature to encrypt
@param digest the digest used for finding the encryption key
@param type type of encryption (8 for XTEA, 9 for Blowfish)
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_rtmpe_encrypt_sig (
    URLContext url_context,
    uint8[] signature,
    uint8[] digest,
    int type
);

/***********************************************************
@brief Update the keystream and set RC4 keys for encryption.

@param h an URLContext
@return zero on success, negative value otherwise
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtmpe_update_keystream (
    URLContext url_context
);

} // namespace LibAVFormat

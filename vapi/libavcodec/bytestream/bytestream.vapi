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
/***********************************************************
Bytestream functions
@copyright 2006 Baptiste Coudurier <baptiste.coudurier@free.fr>
@copyright 2012 Aneesh Dogra (lionaneesh) <lionaneesh@gmail.com>
***********************************************************/
[CCode (cname="struct GetByteContext", cheader_filename="ffmpeg/libavcodec/bytestream.h")]
public struct GetByteContext {
    uint8[] buffer;
    uint8 *buffer_end;
    uint8 *buffer_start;
}

[CCode (cname="struct PutByteContext", cheader_filename="ffmpeg/libavcodec/bytestream.h")]
public struct PutByteContext {
    uint8[] buffer;
    uint8 *buffer_end;
    uint8 *buffer_start;
    int eof;
}

//  #define DEF (type, name, bytes, read, write)
//  static type bytestream_get_ ## name (out uint8[] b) {
//      (*b) += bytes;
//      return read (*b - bytes); //
//  }
//  static void bytestream_put_ ## name (
//      out uint8[] b,
//      const type value
//  ) {
//      write (*b, value); //
//      (*b) += bytes;
//  }
//  static void bytestream2_put_ ## name ## u (
//      PutByteContext put_byte_context,
//      const type value
//  ) {
//      bytestream_put_ ## name (&put_byte_context.buffer, value); //
//  }
//  static void bytestream2_put_ ## name (
//      PutByteContext put_byte_context,
//      const type value
//  ) {
//      if (!put_byte_context.eof && (put_byte_context.buffer_end - put_byte_context.buffer >= bytes)) {
//          write (put_byte_context.buffer, value); //
//          put_byte_context.buffer += bytes;
//      } else
//          put_byte_context.eof = 1;
//  }
//  static type bytestream2_get_ ## name ## u (
//      GetByteContext get_byte_context
//  ) {
//      return bytestream_get_ ## name (&get_byte_context.buffer); //
//  }
//  static type bytestream2_get_ ## name (
//      GetByteContext get_byte_context
//  ) {
//      if (get_byte_context.buffer_end - get_byte_context.buffer < bytes) {
//          get_byte_context.buffer = get_byte_context.buffer_end;
//          return 0;
//      }
//      return bytestream2_get_ ## name ## u (get_byte_context); //
//  }
//  static type bytestream2_peek_ ## name (
//      GetByteContext get_byte_context
//  ) {
//      if (get_byte_context.buffer_end - get_byte_context.buffer < bytes)
//          return 0;
//      return read (get_byte_context.buffer); //
//  }

//  DEF (uint64,     le64, 8, AV_RL64, AV_WL64)
//  DEF (uint, le32, 4, AV_RL32, AV_WL32)
//  DEF (uint, le24, 3, AV_RL24, AV_WL24)
//  DEF (uint, le16, 2, AV_RL16, AV_WL16)
//  DEF (uint64,     be64, 8, AV_RB64, AV_WB64)
//  DEF (uint, be32, 4, AV_RB32, AV_WB32)
//  DEF (uint, be24, 3, AV_RB24, AV_WB24)
//  DEF (uint, be16, 2, AV_RB16, AV_WB16)
//  DEF (uint, byte, 1, AV_RB8 , AV_WB8)

//  #if AV_HAVE_BIGENDIAN
//  #   define bytestream2_get_ne16  bytestream2_get_be16
//  #   define bytestream2_get_ne24  bytestream2_get_be24
//  #   define bytestream2_get_ne32  bytestream2_get_be32
//  #   define bytestream2_get_ne64  bytestream2_get_be64
//  #   define bytestream2_get_ne16u bytestream2_get_be16u
//  #   define bytestream2_get_ne24u bytestream2_get_be24u
//  #   define bytestream2_get_ne32u bytestream2_get_be32u
//  #   define bytestream2_get_ne64u bytestream2_get_be64u
//  #   define bytestream2_put_ne16  bytestream2_put_be16
//  #   define bytestream2_put_ne24  bytestream2_put_be24
//  #   define bytestream2_put_ne32  bytestream2_put_be32
//  #   define bytestream2_put_ne64  bytestream2_put_be64
//  #   define bytestream2_peek_ne16 bytestream2_peek_be16
//  #   define bytestream2_peek_ne24 bytestream2_peek_be24
//  #   define bytestream2_peek_ne32 bytestream2_peek_be32
//  #   define bytestream2_peek_ne64 bytestream2_peek_be64
//  #else
//  #   define bytestream2_get_ne16  bytestream2_get_le16
//  #   define bytestream2_get_ne24  bytestream2_get_le24
//  #   define bytestream2_get_ne32  bytestream2_get_le32
//  #   define bytestream2_get_ne64  bytestream2_get_le64
//  #   define bytestream2_get_ne16u bytestream2_get_le16u
//  #   define bytestream2_get_ne24u bytestream2_get_le24u
//  #   define bytestream2_get_ne32u bytestream2_get_le32u
//  #   define bytestream2_get_ne64u bytestream2_get_le64u
//  #   define bytestream2_put_ne16  bytestream2_put_le16
//  #   define bytestream2_put_ne24  bytestream2_put_le24
//  #   define bytestream2_put_ne32  bytestream2_put_le32
//  #   define bytestream2_put_ne64  bytestream2_put_le64
//  #   define bytestream2_peek_ne16 bytestream2_peek_le16
//  #   define bytestream2_peek_ne24 bytestream2_peek_le24
//  #   define bytestream2_peek_ne32 bytestream2_peek_le32
//  #   define bytestream2_peek_ne64 bytestream2_peek_le64
//  #endif

static void bytestream2_init (
    GetByteContext get_byte_context,
    uint8[] buffer,
    int buf_size
);

static void bytestream2_init_writer (
    PutByteContext put_byte_context,
    uint8[] buffer,
    int buf_size
);

static uint bytestream2_get_bytes_left (
    GetByteContext get_byte_context
);

static uint bytestream2_get_bytes_left_p (
    PutByteContext put_byte_context
);

static void bytestream2_skip (
    GetByteContext get_byte_context,
    uint size
);

static void bytestream2_skipu (
    GetByteContext get_byte_context,
    uint size
);

static void bytestream2_skip_p (
    PutByteContext put_byte_context,
    uint size
);

static int bytestream2_tell (
    GetByteContext get_byte_context
);

static int bytestream2_tell_p (
    PutByteContext put_byte_context
);

static int bytestream2_size (
    GetByteContext get_byte_context
);

static int bytestream2_size_p (
    PutByteContext put_byte_context
);

static int bytestream2_seek (
    GetByteContext get_byte_context,
    int offset,
    int whence
);

static int bytestream2_seek_p (
    PutByteContext put_byte_context,
    int offset,
    int whence
);

static uint bytestream2_get_buffer (
    GetByteContext get_byte_context,
    uint8[] dst,
    uint size
);

static uint bytestream2_get_bufferu (
    GetByteContext get_byte_context,
    uint8[] dst,
    uint size
);

static uint bytestream2_put_buffer (
    PutByteContext put_byte_context,
    uint8[] src,
    uint size
);

static uint bytestream2_put_bufferu (
    PutByteContext put_byte_context,
    uint8[] src,
    uint size
);

static void bytestream2_set_buffer (
    PutByteContext put_byte_context,
    uint8 c,
    uint size
);

static void bytestream2_set_bufferu (
    PutByteContext put_byte_context,
    uint8 c,
    uint size
);

static uint bytestream2_get_eof (
    PutByteContext put_byte_context
);

static uint bytestream2_copy_bufferu (
    PutByteContext put_byte_context,
    GetByteContext get_byte_context,
    uint size
);

static uint bytestream2_copy_buffer (
    PutByteContext put_byte_context,
    GetByteContext get_byte_context,
    uint size
);

static uint bytestream_get_buffer (
    out uint8[] b,
    uint8[] dst,
    uint size
);

static void bytestream_put_buffer (
    out uint8[] b,
    uint8[] src,
    uint size
);

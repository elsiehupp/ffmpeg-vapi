/*
 * Bytestream functions
 * copyright (c) 2006 Baptiste Coudurier <baptiste.coudurier@free.fr>
 * Copyright (c) 2012 Aneesh Dogra (lionaneesh) <lionaneesh@gmail.com>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

public struct GetByteContext {
    uint8[] buffer;
    uint8 *buffer_end;
    uint8 *buffer_start;
}

public struct PutByteContext {
    uint8[] buffer;
    uint8 *buffer_end;
    uint8 *buffer_start;
    int eof;
}

//  #define DEF (type, name, bytes, read, write)                                  \
//  static type bytestream_get_ ## name (out uint8[] b)        \
//  {                                                                              \
//      (*b) += bytes;                                                             \
//      return read (*b - bytes);                                                   \
//  }                                                                              \
//  static void bytestream_put_ ## name (out uint8[] b,              \
//                                                       const type value)         \
//  {                                                                              \
//      write (*b, value);                                                          \
//      (*b) += bytes;                                                             \
//  }                                                                              \
//  static void bytestream2_put_ ## name ## u (PutByteContext *p,  \
//                                                             const type value)   \
//  {                                                                              \
//      bytestream_put_ ## name (&p.buffer, value);                                \
//  }                                                                              \
//  static void bytestream2_put_ ## name (PutByteContext *p,       \
//                                                        const type value)        \
//  {                                                                              \
//      if (!p.eof && (p.buffer_end - p.buffer >= bytes)) {                     \
//          write (p.buffer, value);                                               \
//          p.buffer += bytes;                                                    \
//      } else                                                                     \
//          p.eof = 1;                                                            \
//  }                                                                              \
//  static type bytestream2_get_ ## name ## u (GetByteContext *g)  \
//  {                                                                              \
//      return bytestream_get_ ## name (&g.buffer);                                \
//  }                                                                              \
//  static type bytestream2_get_ ## name (GetByteContext *g)       \
//  {                                                                              \
//      if (g.buffer_end - g.buffer < bytes) {                                   \
//          g.buffer = g.buffer_end;                                             \
//          return 0;                                                              \
//      }                                                                          \
//      return bytestream2_get_ ## name ## u (g);                                   \
//  }                                                                              \
//  static type bytestream2_peek_ ## name (GetByteContext *g)      \
//  {                                                                              \
//      if (g.buffer_end - g.buffer < bytes)                                     \
//          return 0;                                                              \
//      return read (g.buffer);                                                    \
//  }

//  DEF (uint64_t,     le64, 8, AV_RL64, AV_WL64)
//  DEF (uint, le32, 4, AV_RL32, AV_WL32)
//  DEF (uint, le24, 3, AV_RL24, AV_WL24)
//  DEF (uint, le16, 2, AV_RL16, AV_WL16)
//  DEF (uint64_t,     be64, 8, AV_RB64, AV_WB64)
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
    GetByteContext *g,
    uint8[] buf,
    int buf_size
);

static void bytestream2_init_writer (
    PutByteContext *p,
    uint8[] buf,
    int buf_size
);

static uint bytestream2_get_bytes_left (
    GetByteContext *g
);

static uint bytestream2_get_bytes_left_p (
    PutByteContext *p
);

static void bytestream2_skip (
    GetByteContext *g,
    uint size
);

static void bytestream2_skipu (
    GetByteContext *g,
    uint size
);

static void bytestream2_skip_p (
    PutByteContext *p,
    uint size
);

static int bytestream2_tell (
    GetByteContext *g
);

static int bytestream2_tell_p (
    PutByteContext *p
);

static int bytestream2_size (
    GetByteContext *g
);

static int bytestream2_size_p (
    PutByteContext *p
);

static int bytestream2_seek (
    GetByteContext *g,
    int offset,
    int whence
);

static int bytestream2_seek_p (
    PutByteContext *p,
    int offset,
    int whence
);

static uint bytestream2_get_buffer (
    GetByteContext *g,
    uint8[] dst,
    uint size
);

static uint bytestream2_get_bufferu (
    GetByteContext *g,
    uint8[] dst,
    uint size
);

static uint bytestream2_put_buffer (
    PutByteContext *p,
    uint8[] src,
    uint size
);

static uint bytestream2_put_bufferu (
    PutByteContext *p,
    uint8[] src,
    uint size
);

static void bytestream2_set_buffer (
    PutByteContext *p,
    uint8 c,
    uint size
);

static void bytestream2_set_bufferu (
    PutByteContext *p,
    uint8 c,
    uint size
);

static uint bytestream2_get_eof (
    PutByteContext *p
);

static uint bytestream2_copy_bufferu (
    PutByteContext *p,
    GetByteContext *g,
    uint size
);

static uint bytestream2_copy_buffer (
    PutByteContext *p,
    GetByteContext *g,
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
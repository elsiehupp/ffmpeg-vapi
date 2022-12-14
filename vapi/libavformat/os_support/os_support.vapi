/***********************************************************
@brief Various OS-feature replacement utilities
@copyright 2000, 2001, 2002 Fabrice Bellard
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
@file miscellaneous OS support macros and functions.
***********************************************************/

//  #ifdef _WIN32
//  #  include <fcntl.h>
//  #  ifdef lseek
//  #   undef lseek
//  #  endif
//  #  define lseek (f,p,w) _lseeki64 ((f), (p), (w))
//  #  ifdef stat
//  #   undef stat
//  #  endif
//  #  define stat _stati64
//  #  ifdef fstat
//  #   undef fstat
//  #  endif
//  #  define fstat (f,s) _fstati64 ((f), (s))
//  #endif /***********************************************************
    defined (_WIN32)
//      ***********************************************************/


//  #ifdef __ANDROID__
//  #  if HAVE_UNISTD_H
//  #    include <unistd.h>
//  #  endif
//  #  ifdef lseek
//  #   undef lseek
//  #  endif
//  #  define lseek (f,p,w) lseek64 ((f), (p), (w))
//  #endif

// int is 1 for true and 0 for false
//  public static int is_dos_path (
//      string path
//  );

//  #if defined (_WIN32)
//  #if! S_IRUSR
//  #define S_IRUSR S_IREAD
//  #endif
//  #if! S_IWUSR
//  #define S_IWUSR S_IWRITE
//  #endif
//  #endif

//  #if CONFIG_NETWORK
//  #if defined (_WIN32)
//  #define SHUT_RD SD_RECEIVE
//  #define SHUT_WR SD_SEND
//  #define SHUT_RDWR SD_BOTH
//  #else
//  #include <sys/socket.h>
//  #if !defined (SHUT_RD) /***********************************************************
    OS/2, DJGPP
//  ***********************************************************/
//  #define SHUT_RD 0
//  #define SHUT_WR 1
//  #define SHUT_RDWR 2
//  #endif
//  #endif

//  #if !HAVE_SOCKLEN_T
//  typedef int Posix.socklen_t;
//  #endif

/***********************************************************
@brief Most of the time closing a socket is just closing an fd
***********************************************************/
//  #if !HAVE_CLOSESOCKET
//  #define closesocket close
//  #endif

//  #if !HAVE_POLL_H
//  typedef ulong nfds_t;

//  #if HAVE_WINSOCK2_H
//  #include <winsock2.h>
//  #endif
//  #if !HAVE_STRUCT_POLLFD
//  public struct GLib.PollFD {
//      int fd;
//      /***********************************************************
//      events to look for
//      ***********************************************************/
//      short events;
//      /***********************************************************
//      events that occurred
//      ***********************************************************/
//      short revents;
//  }

[Flags]
public enum PollEvent {
    /***********************************************************
    @brief Events & revents
    ***********************************************************/

    /***********************************************************
    @brief Any readable data available
        ***********************************************************/
    POLLIN,
    /***********************************************************
    @brief File descriptor is writeable
        ***********************************************************/
    POLLOUT,
    /***********************************************************
= POLLIN
        ***********************************************************/
    POLLRDNORM,
    /***********************************************************
= POLLOUT
        ***********************************************************/
    POLLWRNORM,
    /***********************************************************
    @brief Priority readable data
        ***********************************************************/
    POLLRDBAND,
    /***********************************************************
    @brief Priority data can be written
        ***********************************************************/
    POLLWRBAND,
    /***********************************************************
    @brief High priority readable data
        ***********************************************************/
    POLLPRI,


    /***********************************************************
    @brief Revents only
    ***********************************************************/

    /***********************************************************
    @brief Errors pending
        ***********************************************************/
    POLLERR,
    /***********************************************************
    @brief Disconnected
        ***********************************************************/
    POLLHUP,
    /***********************************************************
    @brief Invalid file descriptor
        ***********************************************************/
    POLLNVAL,
}
//  #endif


//  int ff_poll (
//      GLib.PollFD fds,
//      nfds_t numfds,
//      int timeout
//  );
//  #define poll ff_poll
//  #endif /***********************************************************
    HAVE_POLL_H
//  ***********************************************************/
//  #endif /***********************************************************
    CONFIG_NETWORK
//  ***********************************************************/

//  #ifdef _WIN32
//  #include <stdio.h>
//  #include <windows.h>

//  #define DEF_FS_FUNCTION (name, wfunc, afunc)
//  static inline int win32_##name (string filename_utf8) {
//      wchar_t filename_w;
//      int ret;
//
//      if (utf8towchar (filename_utf8, &filename_w))
//          return -1;
//      if (!filename_w)
//          goto fallback;
//
//      ret = wfunc (filename_w);
//      av_free (filename_w);
//      return ret;
//
//  fallback:
//      /***********************************************************
//      filename may be be in CP_ACP
//      ***********************************************************/
//      return afunc (filename_utf8);
//  }

//  DEF_FS_FUNCTION (unlink, _wunlink, _unlink)
//  DEF_FS_FUNCTION (mkdir, _wmkdir, _mkdir)
//  DEF_FS_FUNCTION (rmdir, _wrmdir , _rmdir)

//  #define DEF_FS_FUNCTION2 (name, wfunc, afunc, partype)
//  static inline int win32_##name (string filename_utf8, partype par) {
//      wchar_t filename_w;
//      int ret;
//
//      if (utf8towchar (filename_utf8, &filename_w))
//          return -1;
//      if (!filename_w)
//          goto fallback;
//
//      ret = wfunc (filename_w, par);
//      av_free (filename_w);
//      return ret;
//
//  fallback:
//      /***********************************************************
//      filename may be be in CP_ACP
//      ***********************************************************/
//      return afunc (filename_utf8, par);
//  }

//  DEF_FS_FUNCTION2 (access, _waccess, _access, int)
//  DEF_FS_FUNCTION2 (stat, _wstati64, _stati64, stat*)

//  static inline int win32_rename (string src_utf8, string dest_utf8) {
//      wchar_t src_w, *dest_w;
//      int ret;

//      if (utf8towchar (src_utf8, &src_w))
//          return -1;
//      if (utf8towchar (dest_utf8, &dest_w)) {
//          av_free (src_w);
//          return -1;
//      }
//      if (!src_w || !dest_w) {
//          av_free (src_w);
//          av_free (dest_w);
//          goto fallback;
//      }

//      ret = MoveFileExW (src_w, dest_w, MOVEFILE_REPLACE_EXISTING);
//      av_free (src_w);
//      av_free (dest_w);
//      // Lacking proper mapping from GetLastError () error codes to errno codes
//      if (ret)
//          errno = EPERM;
//      return ret;

//  fallback:
//      /***********************************************************
//      filename may be be in CP_ACP
//  ***********************************************************/
//  #if !HAVE_UWP
//      ret = MoveFileExA (src_utf8, dest_utf8, MOVEFILE_REPLACE_EXISTING);
//      if (ret)
//          errno = EPERM;
//  #else
//      /***********************************************************
//      Windows Phone doesn't have MoveFileExA, and for Windows Store apps,
//      it is available but not allowed by the app certification kit. However,
//      it's unlikely that anybody would input filenames in CP_ACP there, so this
//      fallback is kept mostly for completeness. Alternatively we could
//      do MultiByteToWideChar (CP_ACP) and use MoveFileExW, but doing
//      explicit conversions with CP_ACP is allegedly forbidden in windows
//      store apps (or windows phone), and the notion of a native code page
//      doesn't make much sense there.
//      ***********************************************************/
//      ret = rename (src_utf8, dest_utf8);
//  #endif
//      return ret;
//  }

//  #define mkdir (a, b) win32_mkdir (a)
//  #define rename win32_rename
//  #define rmdir win32_rmdir
//  #define unlink win32_unlink
//  #define access win32_access

//  #endif

} // namespace LibAVFormat

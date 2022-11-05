/***********************************************************
@copyright 2007 The FFmpeg Project

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

#if HAVE_WINSOCK2_H

#if !EPROTONOSUPPORT
public const int EPROTONOSUPPORT; // WSAEPROTONOSUPPORT
#endif
#if !ETIMEDOUT
public const int ETIMEDOUT; // WSAETIMEDOUT
#endif
#if !ECONNREFUSED
public const int ECONNREFUSED; // WSAECONNREFUSED
#endif
#if !EINPROGRESS
public const int EINPROGRESS; // WSAEINPROGRESS
#endif
#if !ENOTCONN
public const int ENOTCONN; // WSAENOTCONN
#endif

//  #define getsockopt (a, b, c, d, e) getsockopt (a, b, c, (char*) d, e)
//  #define setsockopt (a, b, c, d, e) setsockopt (a, b, c, (char*) d, e)

int ff_neterrno ();
#else

public LibAVUtil.ErrorCode ff_neterrno (); // LibAVUtil.ErrorCode (errno)
#endif /* HAVE_WINSOCK2_H
***********************************************************/

int ff_socket_nonblock (
    int socket,
    int enable
);

int ff_network_init ();
void ff_network_close ();

int ff_tls_init ();
void ff_tls_deinit ();

int ff_network_wait_fd (
    int fd,
    int write
);

/***********************************************************
This works similarly to ff_network_wait_fd, but waits up to 'timeout' microseconds
Uses ff_network_wait_fd in a loop

@param fd Socket descriptor
@param write Set 1 to wait for socket able to be read, 0 to be written
@param timeout Timeout interval, in microseconds. Actual precision is 100000 mcs, due to ff_network_wait_fd usage
@param int_cb Interrupt callback, is checked before each ff_network_wait_fd call
@return 0 if data can be read/written, LibAVUtil.ErrorCode (ETIMEDOUT) if timeout expired, or negative error code
***********************************************************/
int ff_network_wait_fd_timeout (
    int fd,
    int write,
    int64 timeout,
    AVIOInterruptCB int_cb
);

/***********************************************************
Waits for up to 'timeout' microseconds. If the usert's int_cb is set and
triggered, return before that.
@param timeout Timeout in microseconds. Maybe have lower actual precision.
@param int_cb Interrupt callback, is checked regularly.
@return LibAVUtil.ErrorCode (ETIMEDOUT) if timeout expirted, AVERROR_EXIT if interrupted by int_cb
***********************************************************/
int ff_network_sleep_interruptible (
    int64 timeout,
    AVIOInterruptCB int_cb
);

#if !HAVE_STRUCT_SOCKADDR_STORAGE
public struct sockaddr_storage {
#if HAVE_STRUCT_SOCKADDR_SA_LEN
    uint8 ss_len;
    uint8 ss_family;
#else
    uint16 ss_family;
#endif /* HAVE_STRUCT_SOCKADDR_SA_LEN
    ***********************************************************/
char ss_pad1[6];
    int64 ss_align;
    char ss_pad2[112];
}
#endif /* !HAVE_STRUCT_SOCKADDR_STORAGE
***********************************************************/

public struct sockaddr_union {
    sockaddr_storage storage;
    Posix.SockAddrIn in;
#if HAVE_STRUCT_SOCKADDR_IN6
    Posix.SockAddrIn6 in6;
#endif
}

#if !MSG_NOSIGNAL
public const int MSG_NOSIGNAL; // 0
#endif

#if !HAVE_STRUCT_ADDRINFO
public struct addrinfo {
    int ai_flags;
    int ai_family;
    int ai_socktype;
    int ai_protocol;
    int ai_addrlen;
    Posix.SockAddr ai_addr;
    string ai_canonname;
    addrinfo ai_next;
}
#endif /* !HAVE_STRUCT_ADDRINFO
***********************************************************/

/***********************************************************
ff_getaddrinfo constants
***********************************************************/
#if !EAI_AGAIN
public const int EAI_AGAIN; // 2
#endif
#if !EAI_BADFLAGS
public const int EAI_BADFLAGS; // 3
#endif
#if !EAI_FAIL
public const int EAI_FAIL; // 4
#endif
#if !EAI_FAMILY
public const int EAI_FAMILY; // 5
#endif
#if !EAI_MEMORY
public const int EAI_MEMORY; // 6
#endif
#if !EAI_NODATA
public const int EAI_NODATA; // 7
#endif
#if !EAI_NONAME
public const int EAI_NONAME; // 8
#endif
#if !EAI_SERVICE
public const int EAI_SERVICE; // 9
#endif
#if !EAI_SOCKTYPE
public const int EAI_SOCKTYPE; // 10
#endif

#if !AI_PASSIVE
public const int AI_PASSIVE; // 1
#endif

#if !AI_CANONNAME
public const int AI_CANONNAME; // 2
#endif

#if !AI_NUMERICHOST
public const int AI_NUMERICHOST; // 4
#endif

#if !NI_NOFQDN
public const int NI_NOFQDN; // 1
#endif

#if !NI_NUMERICHOST
public const int NI_NUMERICHOST; // 2
#endif

#if !NI_NAMERQD
public const int NI_NAMERQD; // 4
#endif

#if !NI_NUMERICSERV
public const int NI_NUMERICSERV; // 8
#endif

#if !NI_DGRAM
public const int NI_DGRAM; // 16
#endif

#if !HAVE_GETADDRINFO
int ff_getaddrinfo (
    string node,
    string service,
    addrinfo hints,
    out addrinfo res
);
void ff_freeaddrinfo (
    addrinfo res
);
int ff_getnameinfo (
    Posix.SockAddr sa,
    int salen,
    string host,
    int hostlen,
    string serv,
    int servlen,
    int flags
);
#endif /* !HAVE_GETADDRINFO
***********************************************************/

#if !HAVE_GETADDRINFO || HAVE_WINSOCK2_H
string ff_gai_strerror (
    int ecode
);
#endif /* !HAVE_GETADDRINFO || HAVE_WINSOCK2_H
***********************************************************/

#if !INADDR_LOOPBACK
public const uint INADDR_LOOPBACK;
#endif

#if !INET_ADDRSTRLEN
public const size_t INET_ADDRSTRLEN;
#endif

#if !INET6_ADDRSTRLEN
public const size_t INET6_ADDRSTRLEN; // INET_ADDRSTRLEN
#endif

#if !IN_MULTICAST
public uint32 IN_MULTICAST (uint32 a); // ((((uint32)(a)) & 0xf0000000) == 0xe0000000)
#endif
#if !IN6_IS_ADDR_MULTICAST
public bool IN6_IS_ADDR_MULTICAST (uint8[] a); // (((uint8[] ) (a))[0] == 0xff)
#endif

int ff_is_multicast_address (
    Posix.SockAddr addr
);

/***********************************************************
Time in milliseconds between interrupt check
***********************************************************/
public const int POLLING_TIME;

/***********************************************************
Bind to a file descriptor and poll for a connection.

@param fd First argument of bind ().
@param addr Second argument of bind ().
@param addrlen Third argument of bind ().
@param timeout Polling timeout in milliseconds.
@param h URLContext providing interrupt check
               callback and logging context.
@return A non-blocking file descriptor on success
               or an LibAVUtil.ErrorCode on failure.
***********************************************************/
int ff_listen_bind (
    int fd,
    Posix.SockAddr addr,
    Posix.socklen_t addrlen,
    int timeout,
    URLContext h
);

/***********************************************************
Bind to a file descriptor to an address without accepting connections.
@param fd First argument of bind ().
@param addr Second argument of bind ().
@param addrlen Third argument of bind ().
@return 0 on success or an LibAVUtil.ErrorCode on failure.
***********************************************************/
int ff_listen (
    int fd,
    Posix.SockAddr addr,
    Posix.socklen_t addrlen
);

/***********************************************************
Poll for a single connection on the passed file descriptor.
@param fd The listening socket file descriptor.
@param timeout Polling timeout in milliseconds.
@param h URLContext providing interrupt check
               callback and logging context.
@return A non-blocking file descriptor on success
               or an LibAVUtil.ErrorCode on failure.
***********************************************************/
int ff_accept (
    int fd,
    int timeout,
    URLContext h
);

/***********************************************************
Connect to a file descriptor and poll for result.

@param fd First argument of connect (),
                will be set as non-blocking.
@param addr Second argument of connect ().
@param addrlen Third argument of connect ().
@param timeout Polling timeout in milliseconds.
@param h URLContext providing interrupt check
                callback and logging context.
@param will_try_next Whether the caller will try to connect to another
                address for the same host name, affecting the form of
                logged errors.
@return 0 on success, LibAVUtil.ErrorCode on failure.
***********************************************************/
int ff_listen_connect (
    int fd,
    Posix.SockAddr addr,
    Posix.socklen_t addrlen,
    int timeout,
    URLContext h,
    int will_try_next
);

int ff_http_match_no_proxy (
    string no_proxy,
    string hostname
);

int ff_socket (
    int domain,
    int type,
    int protocol
);

void ff_log_net_error (
    void *opaque_context,
    int level,
    char* prefix
);

/***********************************************************
Connect to any of the given addrinfo addresses, with multiple attempts
running in parallel.

@param addrs The list of addresses to try to connect to.
                This list will be mutated internally, but the list head
                will remain as such, so this doesn't affect the caller
                freeing the list afterwards.
@param timeout_ms_per_address The number of milliseconds to wait for each
                connection attempt. Since multiple addresses are tried,
                some of them in parallel, the total run time will at most
                be timeout_ms_per_address*ceil (nb_addrs/parallel) +
                (parallel - 1) * NEXT_ATTEMPT_DELAY_MS.
@param parallel The maximum number of connections to attempt in parallel.
                This is limited to an internal maximum capacity.
@param h URLContext providing interrupt check
                callback and logging context.
@param fd If successful, the connected socket is returned here.
@param customize_fd Function that will be called for each socket created,
                to allow the caller to set socket options before calling
                connect () on it, may be NULL.
@param customize_ctx Context parameter passed to customize_fd.
@return 0 on success, LibAVUtil.ErrorCode on failure.
***********************************************************/
int ff_connect_parallel (
    addrinfo[] addrs,
    int timeout_ms_per_address,
    int parallel,
    URLContext h,
    out int fd,
    CustomizeFileDescriptorDelegate customize_fd,
    void *customize_ctx
);
public delegate void CustomizeFileDescriptorDelegate (void *opaque, int arg);

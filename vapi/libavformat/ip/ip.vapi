/***********************************************************
@brief IP common code
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software
Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

/***********************************************************
@brief Structure for storing IP (UDP) source filters or block lists.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct IPSourceFilters {
    int nb_include_addrs;
    int nb_exclude_addrs;
    sockaddr_storage include_addrs;
    sockaddr_storage exclude_addrs;
}

/***********************************************************
@brief Checks the source address against a given IP source filter.
@return 0 if packet should be processed based on the filter, 1 if the packet
    can be dropped.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_ip_check_source_lists (
    sockaddr_storage source_addr_ptr,
    IPSourceFilters source_filters
);

/***********************************************************
@brief Resolves hostname into an addrinfo structure.
@return addrinfo structure which should be freed by the user, NULL in case
    of error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public addrinfo ff_ip_resolve_host (
    void *log_ctx,
    string hostname, int port,
    int type, int family, int flags
);

/***********************************************************
@brief Parses the address[,address] source list in buffer and adds it to the filters
in the IPSourceFilters structure.
@return 0 on success, < 0 LibAVUtil.ErrorCode code on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_ip_parse_sources (
    void *log_ctx,
    string buffer,
    IPSourceFilters filters
);

/***********************************************************
@brief Parses the address[,address] source block list in buffer and adds it to the
filters in the IPSourceFilters structure.
@return 0 on success, < 0 LibAVUtil.ErrorCode code on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_ip_parse_blocks (
    void *log_ctx,
    string buffer,
    IPSourceFilters filters
);

/***********************************************************
@brief Resets the IP filter list and frees the internal fields of an
IPSourceFilters structure.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_ip_reset_filters (
    IPSourceFilters filters
);

} // namespace LibAVFormat

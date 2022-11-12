/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

/***********************************************************
@file @ingroup LibAVUtil.Memory
Memory handling functions
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Memory
Utilities for manipulating memory.

FFmpeg has several applications of memory that are not required of a typical
program. For example, the computing-heavy components like video decoding and
encoding can be sped up significantly through the use of aligned memory.

However, for each of FFmpeg's applications of memory, there might not be a
recognized or standardized API for that specific use. Memory alignment, for
instance, varies wildly depending on operating systems, architectures, and
compilers. Hence, this component of @link libavutil is created to make
dealing with memory consistently possible on all platforms.


@defgroup lavu_mem_macros Alignment Macros
Helper macros for declaring aligned variables.
***********************************************************/

/***********************************************************
@def DECLARE_ALIGNED (n,t,v)
Declare a variable that is aligned in memory.

@code {.c}
DECLARE_ALIGNED (16, uint16, aligned_int) = 42;
DECLARE_ALIGNED (32, uint8, aligned_array)[128];

// The default-alignment equivalent would be
uint16 aligned_int = 42;
uint8 aligned_array[128];
@endcode

@param n Minimum alignment in bytes
@param t Type of the variable (or array element)
@param v Name of the variable
***********************************************************/

/***********************************************************
@def DECLARE_ASM_ALIGNED (n,t,v)
Declare an aligned variable appropriate for use in inline assembly code.

@code {.c}
DECLARE_ASM_ALIGNED (16, uint64, pw_08) = UINT64_C (0x0008000800080008);
@endcode

@param n Minimum alignment in bytes
@param t Type of the variable (or array element)
@param v Name of the variable
***********************************************************/

/***********************************************************
@def DECLARE_ASM_CONST (n,t,v)
Declare a static constant aligned variable appropriate for use in inline
assembly code.

@code {.c}
DECLARE_ASM_CONST (16, uint64, pw_08) = UINT64_C (0x0008000800080008);
@endcode

@param n Minimum alignment in bytes
@param t Type of the variable (or array element)
@param v Name of the variable
***********************************************************/

//  #if defined (__INTEL_COMPILER) && __INTEL_COMPILER < 1110 || defined (__SUNPRO_C)
//      #define DECLARE_ALIGNED (n,t,v)      t __attribute__ ((aligned (n))) v
//      #define DECLARE_ASM_ALIGNED (n,t,v)  t __attribute__ ((aligned (n))) v
//      #define DECLARE_ASM_CONST (n,t,v)    t __attribute__ ((aligned (n))) v
//  #elif defined (__DJGPP__)
//      #define DECLARE_ALIGNED (n,t,v)      t __attribute__ ((aligned (FFMIN (n, 16)))) v
//      #define DECLARE_ASM_ALIGNED (n,t,v)  t av_used __attribute__ ((aligned (FFMIN (n, 16)))) v
//      #define DECLARE_ASM_CONST (n,t,v)    public const t av_used __attribute__ ((aligned (FFMIN (n, 16)))) v
//  #elif defined (__GNUC__) || defined (__clang__)
//      #define DECLARE_ALIGNED (n,t,v)      t __attribute__ ((aligned (n))) v
//      #define DECLARE_ASM_ALIGNED (n,t,v)  t av_used __attribute__ ((aligned (n))) v
//      #define DECLARE_ASM_CONST (n,t,v)    public const t av_used __attribute__ ((aligned (n))) v
//  #elif defined (_MSC_VER)
//      #define DECLARE_ALIGNED (n,t,v)      __declspec (align (n)) t v
//      #define DECLARE_ASM_ALIGNED (n,t,v)  __declspec (align (n)) t v
//      #define DECLARE_ASM_CONST (n,t,v)    __declspec (align (n)) public const t v
//  #else
//      #define DECLARE_ALIGNED (n,t,v)      t v
//      #define DECLARE_ASM_ALIGNED (n,t,v)  t v
//      #define DECLARE_ASM_CONST (n,t,v)    public const t v
//  #endif

/***********************************************************
@defgroup lavu_mem_attrs Function Attributes
Function attributes applicable to memory handling functions.

These function attributes can help compilers emit more useful warnings, or
generate better code.
***********************************************************/

/***********************************************************
@def av_malloc_attrib
Function attribute denoting a malloc-like function.

@see @link <a href="https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-g_t_0040code_007bmalloc_007d-function-attribute-3251">Function attribute `malloc` in GCC's documentation</a>
***********************************************************/

//  #if AV_GCC_VERSION_AT_LEAST (3,1)
//      #define av_malloc_attrib __attribute__ ((__malloc__))
//  #else
//      #define av_malloc_attrib
//  #endif

/***********************************************************
@def av_alloc_size (...)
Function attribute used on a function that allocates memory, whose size is
given by the specified parameter (s).

@code {.c}
void *av_malloc (size_t size) av_alloc_size (1);
void *av_calloc (size_t nmemb, size_t size) av_alloc_size (1, 2);
@endcode

@param ... One or two parameter indexes, separated by a comma

@see @link <a href="https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-g_t_0040code_007balloc_005fsize_007d-function-attribute-3220">Function attribute `alloc_size` in GCC's documentation</a>
***********************************************************/

//  #if AV_GCC_VERSION_AT_LEAST (4,3)
//      #define av_alloc_size (...) __attribute__ ((alloc_size (__VA_ARGS__)))
//  #else
//      #define av_alloc_size (...)
//  #endif

/***********************************************************
@defgroup lavu_mem_funcs Heap Management
Functions responsible for allocating, freeing, and copying memory.

All memory allocation functions have a built-in upper limit of `int.MAX`
bytes. This may be changed with av_max_alloc (), although exercise extreme
caution when doing so.
***********************************************************/

/***********************************************************
@brief Allocate a memory block with alignment suitable for all memory accesses
(including vectors if available on the CPU).

@param size Size in bytes for the memory block to be allocated
@return Pointer to the allocated block, or `null` if the block cannot
    be allocated
@see @link av_mallocz ()
***********************************************************/
[CCode (cname="av_malloc", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_malloc (
    size_t size
); // av_malloc_attrib av_alloc_size (1);

/***********************************************************
@brief Allocate a memory block with alignment suitable for all memory accesses
(including vectors if available on the CPU) and zero all the bytes of the
block.

@param size Size in bytes for the memory block to be allocated
@return Pointer to the allocated block, or `null` if it cannot be allocated
@see @link av_malloc ()
***********************************************************/
[CCode (cname="av_mallocz", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_mallocz (
    size_t size
); // av_malloc_attrib av_alloc_size (1);

/***********************************************************
@brief Allocate a memory block for an array with av_malloc ().

The allocated memory will have size `size * nmemb` bytes.

@param nmemb Number of element
@param size Size of a single element
@return Pointer to the allocated block, or `null` if the block cannot
    be allocated
@see @link av_malloc ()
***********************************************************/
[CCode (cname="av_malloc_array", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_malloc_array (
    size_t nmemb,
    size_t size
); // av_alloc_size (1, 2)

/***********************************************************
@brief Allocate a memory block for an array with av_mallocz ().

The allocated memory will have size `size * nmemb` bytes.

@param nmemb Number of elements
@param size Size of the single element
@return Pointer to the allocated block, or `null` if the block cannot
    be allocated

@see @link av_mallocz ()
@see @link av_malloc_array ()
***********************************************************/
[CCode (cname="av_mallocz_array", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_mallocz_array (
    size_t nmemb,
    size_t size
); // av_alloc_size (1, 2)

/***********************************************************
@brief Non-inlined equivalent of av_mallocz_array ().

Created for symmetry with the calloc () C function.
***********************************************************/
[CCode (cname="av_calloc", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_calloc (
    size_t nmemb,
    size_t size
); // av_malloc_attrib;

/***********************************************************
@brief Allocate, reallocate, or free a block of memory.

If `ptr` is `null` and `size` > 0, allocate a new block. If `size` is
zero, free the memory block pointed to by `ptr`. Otherwise, expand or
shrink that block of memory according to `size`.

@param ptr Pointer to a memory block already allocated with
    av_realloc () or `null`
@param size Size in bytes of the memory block to be allocated or
    reallocated

@return Pointer to a newly-reallocated block or `null` if the block
    cannot be reallocated or the function is used to free the memory block

@warning Unlike av_malloc (), the returned pointer is not guaranteed to be
    correctly aligned.
@see @link av_fast_realloc ()
@see @link av_reallocp ()
***********************************************************/
[CCode (cname="av_realloc", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_realloc (
    out void *ptr,
    size_t size
); // av_alloc_size (2);

/***********************************************************
@brief Allocate, reallocate, or free a block of memory through a pointer to a
pointer.

If `*ptr` is `null` and `size` > 0, allocate a new block. If `size` is
zero, free the memory block pointed to by `*ptr`. Otherwise, expand or
shrink that block of memory according to `size`.

@param[in,out] ptr Pointer to a pointer to a memory block already allocated
    with av_realloc (), or a pointer to `null`. The pointer
    is updated on success, or freed on failure.
@param[in] size Size in bytes for the memory block to be allocated or
    reallocated

@return 0 on success, an LibAVUtil.ErrorCode error code on failure

@warning Unlike av_malloc (), the allocated memory is not guaranteed to be
    correctly aligned.
***********************************************************/
[CCode (cname="av_reallocp", cheader_filename="ffmpeg/libavutil/mem.h")]
public int av_reallocp (
    out void *ptr,
    size_t size
); // av_warn_unused_result

/***********************************************************
@brief Allocate, reallocate, or free a block of memory.

This function does the same thing as av_realloc (), except:
- It takes two size arguments and allocates `nelem * elsize` bytes,
    after checking the result of the multiplication for integer overflow.
- It frees the input block in case of failure, thus avoiding the memory
    leak with the classic
    @code {.c}
    buffer = realloc (buffer);
    if (!buffer)
        return -1;
    @endcode
    pattern.
***********************************************************/
[CCode (cname="av_realloc_f", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_realloc_f (
    out void *ptr,
    size_t nelem,
    size_t elsize
);

/***********************************************************
@brief Allocate, reallocate, or free an array.

If `ptr` is `null` and `nmemb` > 0, allocate a new block. If
`nmemb` is zero, free the memory block pointed to by `ptr`.

@param ptr Pointer to a memory block already allocated with
    av_realloc () or `null`
@param nmemb Number of elements in the array
@param size Size of the single element of the array

@return Pointer to a newly-reallocated block or null if the block
    cannot be reallocated or the function is used to free the memory block

@warning Unlike av_malloc (), the allocated memory is not guaranteed to be
    correctly aligned.
@see @link av_reallocp_array ()
***********************************************************/
[CCode (cname="av_realloc_array", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_realloc_array (
    out void *ptr,
    size_t nmemb,
    size_t size
); // av_alloc_size (2, 3)

/***********************************************************
@brief Allocate, reallocate, or free an array through a pointer to a pointer.

If `*ptr` is `null` and `nmemb` > 0, allocate a new block. If `nmemb` is
zero, free the memory block pointed to by `*ptr`.

@param[in,out] ptr Pointer to a pointer to a memory block already
    allocated with av_realloc (), or a pointer to `null`.
    The pointer is updated on success, or freed on failure.
@param[in] nmemb Number of elements
@param[in] size Size of the single element

@return 0 on success, an LibAVUtil.ErrorCode error code on failure

@warning Unlike av_malloc (), the allocated memory is not guaranteed to be
    correctly aligned.
***********************************************************/
[CCode (cname="av_reallocp_array", cheader_filename="ffmpeg/libavutil/mem.h")]
public int av_reallocp_array (
    out void *ptr,
    size_t nmemb,
    size_t size
);

/***********************************************************
@brief Reallocate the given buffer if it is not large enough, otherwise do nothing.

If the given buffer is `null`, then a new uninitialized buffer is allocated.

If the given buffer is not large enough, and reallocation fails, `null` is
returned and `*size` is set to 0, but the original buffer is not changed or
freed.

A typical use pattern follows:

@code {.c}
uint8[] buffer = ...;
uint8[] new_buf = av_fast_realloc (buffer, &current_size, size_needed);
if (!new_buf) {
    // Allocation failed; clean up original buffer
    av_freep (&buffer);
    return LibAVUtil.ErrorCode (ENOMEM);
}
@endcode

@param[in,out] ptr Already allocated buffer, or `null`
@param[in,out] size Pointer to the size of buffer `ptr`. `*size` is
    updated to the new allocated size, in particular 0
    in case of failure.
@param[in] min_size Desired minimal size of buffer `ptr`
@return `ptr` if the buffer is large enough, a pointer to newly reallocated
    buffer if the buffer was not large enough, or `null` in case of
    error
@see @link av_realloc ()
@see @link av_fast_malloc ()
***********************************************************/
[CCode (cname="av_fast_realloc", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_fast_realloc (
    out void *ptr,
    out uint size,
    size_t min_size
);

/***********************************************************
@brief Allocate a buffer, reusing the given one if large enough.

Contrary to av_fast_realloc (), the current buffer contents might not be
preserved and on error the old buffer is freed, thus no special handling to
avoid memleaks is necessary.

`*ptr` is allowed to be `null`, in which case allocation always happens if
`size_needed` is greater than 0.

@code {.c}
uint8[] buffer = ...;
av_fast_malloc (&buffer, &current_size, size_needed);
if (!buffer) {
    // Allocation failed; buffer already freed
    return LibAVUtil.ErrorCode (ENOMEM);
}
@endcode

@param[in,out] ptr Pointer to pointer to an already allocated buffer.
    `*ptr` will be overwritten with pointer to new
    buffer on success or `null` on failure
@param[in,out] size Pointer to the size of buffer `*ptr`. `*size` is
    updated to the new allocated size, in particular 0
    in case of failure.
@param[in] min_size Desired minimal size of buffer `*ptr`
@see @link av_realloc ()
@see @link av_fast_mallocz ()
***********************************************************/
[CCode (cname="av_fast_malloc", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_fast_malloc (
    out void *ptr,
    out uint size,
    size_t min_size
);

/***********************************************************
@brief Allocate and clear a buffer, reusing the given one if large enough.

Like av_fast_malloc (), but all newly allocated space is initially cleared.
Reused buffer is not cleared.

`*ptr` is allowed to be `null`, in which case allocation always happens if
`size_needed` is greater than 0.

@param[in,out] ptr Pointer to pointer to an already allocated buffer.
    `*ptr` will be overwritten with pointer to new
    buffer on success or `null` on failure
@param[in,out] size Pointer to the size of buffer `*ptr`. `*size` is
    updated to the new allocated size, in particular 0
    in case of failure.
@param[in] min_size Desired minimal size of buffer `*ptr`
@see @link av_fast_malloc ()
***********************************************************/
[CCode (cname="av_fast_mallocz", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_fast_mallocz (
    out void *ptr,
    out uint size,
    size_t min_size
);

/***********************************************************
@brief Free a memory block which has been allocated with a function of av_malloc ()
or av_realloc () family.

@param ptr Pointer to the memory block which should be freed.

@note `ptr = null` is explicitly allowed.
@note It is recommended that you use av_freep () instead, to prevent leaving
      behind dangling pointers.
@see @link av_freep ()
***********************************************************/
[CCode (cname="av_free", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_free (
    out void *ptr
);

/***********************************************************
@brief Free a memory block which has been allocated with a function of av_malloc ()
or av_realloc () family, and set the pointer pointing to it to `null`.

@code {.c}
uint8[] buffer = av_malloc (16);
av_free (buffer);
// buffer now contains a dangling pointer to freed memory, and accidental
// dereference of buffer will result in a use-after-free, which may be a
// security risk.

uint8[] buffer = av_malloc (16);
av_freep (&buffer);
// buffer is now null, and accidental dereference will only result in a
// null-pointer dereference.
@endcode

@param ptr Pointer to the pointer to the memory block which should be freed
@note `*ptr = null` is safe and leads to no action.
@see @link av_free ()
***********************************************************/
[CCode (cname="av_freep", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_freep (
    out void *ptr
);

/***********************************************************
@brief Duplicate a string.

@param s String to be duplicated
@return Pointer to a newly-allocated string containing a
    copy of `s` or `null` if the string cannot be allocated
@see @link av_strndup ()
***********************************************************/
[CCode (cname="av_strdup", cheader_filename="ffmpeg/libavutil/mem.h")]
public string av_strdup (
    string s
); // av_malloc_attrib;

/***********************************************************
@brief Duplicate a substring of a string.

@param s String to be duplicated
@param len Maximum length of the resulting string (not counting the
    terminating byte)
@return Pointer to a newly-allocated string containing a
    substring of `s` or `null` if the string cannot be allocated
***********************************************************/
[CCode (cname="av_strndup", cheader_filename="ffmpeg/libavutil/mem.h")]
public string av_strndup (
    string s,
    size_t len
); // av_malloc_attrib;

/***********************************************************
@brief Duplicate a buffer with av_malloc ().

@param p Buffer to be duplicated
@param size Size in bytes of the buffer copied
@return Pointer to a newly allocated buffer containing a
    copy of `p` or `null` if the buffer cannot be allocated
***********************************************************/
[CCode (cname="av_memdup", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_memdup (
    void *p,
    size_t size
);

/***********************************************************
@brief Overlapping memcpy () implementation.

@param output_buffer Destination buffer
@param back Number of bytes back to start copying (i.e. the initial size of
    the overlapping window); must be > 0
@param cnt Number of bytes to copy; must be >= 0

@note `cnt > back` is valid, this will copy the bytes we just copied,
      thus creating a repeating pattern with a period length of `back`.
***********************************************************/
[CCode (cname="av_memcpy_backptr", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_memcpy_backptr (
    out uint8[] output_buffer,
    int back,
    int cnt
);

/***********************************************************
@defgroup lavu_mem_dynarray Dynamic Array

Utilities to make an array grow when needed.

Sometimes, the programmer would want to have an array that can grow when
needed. The libavutil dynamic array utilities fill that need.

libavutil supports two systems of appending elements onto a dynamically
allocated array, the first one storing the pointer to the value in the
array, and the second storing the value directly. In both systems, the
caller is responsible for maintaining a variable containing the length of
the array, as well as freeing of the array after use.

The first system stores pointers to values in a block of dynamically
allocated memory. Since only pointers are stored, the function does not need
to know the size of the type. Both av_dynarray_add () and
av_dynarray_add_nofree () implement this system.

@code
type **array = null; ///< an array of pointers to values
int nb = 0; ///< a variable to keep track of the length of the array

type to_be_added = ...;
type to_be_added2 = ...;

av_dynarray_add (&array, &nb, &to_be_added);
if (nb == 0)
    return LibAVUtil.ErrorCode (ENOMEM);

av_dynarray_add (&array, &nb, &to_be_added2);
if (nb == 0)
    return LibAVUtil.ErrorCode (ENOMEM);

// Now:
//  nb == 2
// &to_be_added == array[0]
// &to_be_added2 == array[1]

av_freep (&array);
@endcode

The second system stores the value directly in a block of memory. As a
result, the function has to know the size of the type. av_dynarray2_add ()
implements this mechanism.

@code
type array = null; ///< an array of values
int nb = 0; ///< a variable to keep track of the length of the array

type to_be_added = ...;
type to_be_added2 = ...;

type addr = av_dynarray2_add ((out void *)&array, &nb, sizeof (*array), null);
if (!addr)
    return LibAVUtil.ErrorCode (ENOMEM);
memcpy (addr, &to_be_added, sizeof (to_be_added));

// Shortcut of the above.
type addr = av_dynarray2_add ((out void *)&array, &nb, sizeof (*array),
    (void *)&to_be_added2);
if (!addr)
    return LibAVUtil.ErrorCode (ENOMEM);

// Now:
//  nb == 2
//  to_be_added == array[0]
//  to_be_added2 == array[1]

av_freep (&array);
@endcode
***********************************************************/

/***********************************************************
@brief Add the pointer to an element to a dynamic array.

The array to grow is supposed to be an array of pointers to
structures, and the element to add must be a pointer to an already
allocated structure.

The array is reallocated when its size reaches powers of 2.
Therefore, the amortized cost of adding an element is constant.

In case of success, the pointer to the array is updated in order to
point to the new grown array, and the number pointed to by `nb_ptr`
is incremented.
In case of failure, the array is freed, `*tab_ptr` is set to `null` and
`*nb_ptr` is set to 0.

@param[in,out] tab_ptr Pointer to the array to grow
@param[in,out] nb_ptr Pointer to the number of elements in the array
@param[in] elem Element to add
@see @link av_dynarray_add_nofree (), av_dynarray2_add ()
***********************************************************/
[CCode (cname="av_dynarray_add", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_dynarray_add (
    out void *tab_ptr,
    out int nb_ptr,
    void *elem
);

/***********************************************************
@brief Add an element to a dynamic array.

Function has the same functionality as av_dynarray_add (),
but it doesn't free memory on fails. It returns error code
instead and leave current buffer untouched.

@return >=0 on success, negative otherwise
@see @link av_dynarray_add (), av_dynarray2_add ()
***********************************************************/
[CCode (cname="av_dynarray_add_nofree", cheader_filename="ffmpeg/libavutil/mem.h")]
public int av_dynarray_add_nofree (
    void *tab_ptr,
    out int nb_ptr,
    void *elem
); // av_warn_unused_result

/***********************************************************
@brief Add an element of size `elem_size` to a dynamic array.

The array is reallocated when its number of elements reaches powers of 2.
Therefore, the amortized cost of adding an element is constant.

In case of success, the pointer to the array is updated in order to
point to the new grown array, and the number pointed to by `nb_ptr`
is incremented.
In case of failure, the array is freed, `*tab_ptr` is set to `null` and
`*nb_ptr` is set to 0.

@param[in,out] tab_ptr Pointer to the array to grow
@param[in,out] nb_ptr Pointer to the number of elements in the array
@param[in] elem_size Size in bytes of an element in the array
@param[in] elem_data Pointer to the data of the element to add. If
    `null`, the space of the newly added element is
    allocated but left uninitialized.

@return Pointer to the data of the element to copy in the newly allocated
    space
@see @link av_dynarray_add (), av_dynarray_add_nofree ()
***********************************************************/
[CCode (cname="av_dynarray2_add", cheader_filename="ffmpeg/libavutil/mem.h")]
public void *av_dynarray2_add (
    out void *tab_ptr,
    out int nb_ptr,
    size_t elem_size,
    uint8[] elem_data
);

/***********************************************************
@defgroup lavu_mem_misc Miscellaneous Functions

Other functions related to memory allocation.
***********************************************************/

/***********************************************************
@brief Multiply two `size_t` values checking for overflow.

@param[in] a,b Operands of multiplication
@param[out] r Pointer to the result of the operation
@return 0 on success, LibAVUtil.ErrorCode (EINVAL) on overflow
***********************************************************/
[CCode (cname="av_size_mult", cheader_filename="ffmpeg/libavutil/mem.h")]
public static int av_size_mult (
    size_t a,
    size_t b,
    out size_t r
);

/***********************************************************
@brief Set the maximum size that may be allocated in one block.

The value specified with this function is effective for all libavutil's @ref
lavu_mem_funcs "heap management functions."

By default, the max value is defined as `int.MAX`.

@param max Value to be set as the new maximum size

@warning Exercise extreme caution when using this function. Don't touch
    this if you do not understand the full consequence of doing so.
***********************************************************/
[CCode (cname="av_max_alloc", cheader_filename="ffmpeg/libavutil/mem.h")]
public void av_max_alloc (
    size_t max
);

} // namespace LibAVUtil

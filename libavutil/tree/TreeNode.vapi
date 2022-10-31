/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>

This file is part of FFmpeg.

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
@file
A tree container.
@author Michael Niedermayer <michaelni@gmx.at>
***********************************************************/

/***********************************************************
@addtogroup lavu_tree LibAVUtil.Tree
@ingroup LibAVUtil.Data

Low-complexity tree container

Insertion, removal, finding equal, largest which is smaller than and
smallest which is larger than, all have O (log n) worst-case complexity.
***********************************************************/

public delegate int TreeFindComparisonDelegate (
    void *key,
    void *b
);

public delegate int TreeEnumerateComparisonDelegate (
    void *opaque,
    void *elem
);

public delegate int TreeEnumerateEnumerationDelegate (
    void *opaque,
    void *elem
);

[CCode (cname="struct AVTreeNode", cheader_filename="libavcodec/tree.h")]
public struct TreeNode {
    [CCode (cname="av_tree_node_size", cheader_filename="libavcodec/tree.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an TreeNode.
    ***********************************************************/
    [CCode (cname="av_tree_node_alloc", cheader_filename="libavcodec/tree.h")]
    public TreeNode av_tree_node_alloc ();

    /***********************************************************
    @brief Find an element.
    @param root a pointer to the root node of the tree
    @param next If next is not null, then next[0] will contain the previous
        element and next[1] the next element. If either does not exist,
        then the corresponding entry in next is unchanged.
    @param cmp compare function used to compare elements in the tree,
        API identical to that of Standard C's qsort
        It is guaranteed that the first and only the first argument to cmp ()
        will be the key parameter to av_tree_find (), thus it could if the
        user wants, be a different type (like an opaque context).
    @return An element with cmp (key, elem) == 0 or null if no such element
        exists in the tree.
    ***********************************************************/
    [CCode (cname="av_tree_find", cheader_filename="libavcodec/tree.h")]
    public void *av_tree_find (
        TreeNode root,
        void *key,
        TreeFindComparisonDelegate cmp,
        void *next[2]
    );

    /***********************************************************
    @brief Insert or remove an element.

    If *next is null, then the supplied element will be removed if it exists.
    If *next is non-null, then the supplied element will be inserted, unless
    it already exists in the tree.

    @param rootp A pointer to a pointer to the root node of the tree; note that
        the root node can change during insertions, this is required
        to keep the tree balanced.
    @param key pointer to the element key to insert in the tree
    @param next Used to allocate and free TreeNodes. For insertion the user
        must set it to an allocated and zeroed object of at least
        av_tree_node_size bytes size. av_tree_insert () will set it to
        null if it has been consumed.
        For deleting elements *next is set to null by the user and
        av_tree_insert () will set it to the TreeNode which was
        used for the removed element.
        This allows the use of flat arrays, which have
        lower overhead compared to many malloced elements.
        You might want to define a function like:
        @code
        void *tree_insert (
            TreeNode rootp,
            void *key,
            int (*cmp)(void *key, void *b),
            out TreeNode next
        ) {
            if (next == null) {
                next = av_mallocz (av_tree_node_size);
            }
            return av_tree_insert (rootp, key, cmp, next);
        }
        void *tree_remove (
            TreeNode rootp,
            void *key,
            int (*cmp)(void *key, void *b, TreeNode next)
        ) {
            av_freep (next);
            return av_tree_insert (rootp, key, cmp, next);
        }
        @endcode
    @param cmp compare function used to compare elements in the tree, API identical
        to that of Standard C's qsort
    @return If no insertion happened, the found element; if an insertion or
        removal happened, then either key or null will be returned.
        Which one it is depends on the tree state and the implementation. You
        should make no assumptions that it's one or the other in the code.
    ***********************************************************/
    [CCode (cname="av_tree_insert", cheader_filename="libavcodec/tree.h")]
    public void *av_tree_insert (
        out TreeNode rootp,
        void *key,
        TreeFindComparisonDelegate cmp,
        out TreeNode next
    );

    [CCode (cname="av_tree_destroy", cheader_filename="libavcodec/tree.h")]
    public void av_tree_destroy (
        TreeNode t
    );

    /***********************************************************
    @brief Apply enu (opaque, elem) to all the elements in the tree in a given range.

    @param cmp a comparison function that returns < 0 for an element below the
        range, > 0 for an element above the range and == 0 for an
        element inside the range

    @note The cmp function should use the same ordering used to construct the
        tree.
    ***********************************************************/
    [CCode (cname="av_tree_enumerate", cheader_filename="libavcodec/tree.h")]
    public void av_tree_enumerate (
        TreeNode t,
        void *opaque,
        TreeEnumerateComparisonDelegate cmp,
        TreeEnumerateEnumerationDelegate enu
    );
}

} // namespace LibAVUtil


/***********************************************************
@brief List of possible 3D Types
***********************************************************/
[CCode (cheader_filename="ffmpeg/libavutil/stereo3d.h")]
public enum Stereo3DType {
    /***********************************************************
    @brief Video is not stereoscopic (and metadata has to be there).
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_2D")]
    NOT_STEREOSCOPIC,

    /***********************************************************
    @brief Views are next to each other.

    @code {.unparsed}
        LLLLRRRR
        LLLLRRRR
        LLLLRRRR
        ...
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_SIDEBYSIDE")]
    SIDE_BY_SIDE,

    /***********************************************************
    @brief Views are on top of each other.

    @code {.unparsed}
        LLLLLLLL
        LLLLLLLL
        RRRRRRRR
        RRRRRRRR
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_TOPBOTTOM")]
    TOP_AND_BOTTOM,

    /***********************************************************
    @brief Views are alternated temporally.

    @code {.unparsed}
        frame0 frame1 frame2   ...
        LLLLLLLL RRRRRRRR LLLLLLLL
        LLLLLLLL RRRRRRRR LLLLLLLL
        LLLLLLLL RRRRRRRR LLLLLLLL
        ...      ...      ...
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_FRAMESEQUENCE")]
    ALTERNATING_FRAMES,

    /***********************************************************
    @brief Views are packed in a checkerboard-like structure per pixel.

    @code {.unparsed}
        LRLRLRLR
        RLRLRLRL
        LRLRLRLR
        ...
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_CHECKERBOARD")]
    CHECKERBOARD,

    /***********************************************************
    @brief Views are next to each other, but when upscaling
        apply a checkerboard pattern.

    @code {.unparsed}
        LLLLRRRR L L L L R R R R
        LLLLRRRR =>    L L L L R R R R
        LLLLRRRR L L L L R R R R
        LLLLRRRR L L L L R R R R
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_SIDEBYSIDE_QUINCUNX")]
    SIDE_BY_SIDE_QUINCUNX,

    /***********************************************************
    @brief Views are packed per line, as if interlaced.

    @code {.unparsed}
        LLLLLLLL
        RRRRRRRR
        LLLLLLLL
        ...
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_LINES")]
    ALTERNATING_LINES,

    /***********************************************************
    @brief Views are packed per column.

    @code {.unparsed}
        LRLRLRLR
        LRLRLRLR
        LRLRLRLR
        ...
    @endcode
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_COLUMNS")]
    ALTERNATING_COLUMNS,
}

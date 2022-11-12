
[Flags]
[CCode (cheader_filename="ffmpeg/libavutil/stereo3d.h")]
public enum Stereo3DFlags {
    /***********************************************************
    @brief Inverted views, Right/Bottom represents the left view.
        ***********************************************************/
    [CCode (cname="AV_STEREO3D_FLAG_INVERT")]
    INVERT_VIEWS,
}

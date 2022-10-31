
/***********************************************************
@brief List of possible view types.
***********************************************************/
[CCode (cprefix="AV_STEREO3D_VIEW_", cheader_filename="libavcodec/stereo3d.h")]
public enum Stereo3DView {
    /***********************************************************
    @brief Frame contains two packed views.
    ***********************************************************/
    PACKED,

    /***********************************************************
    @brief Frame contains only the left view.
    ***********************************************************/
    LEFT,

    /***********************************************************
    @brief Frame contains only the right view.
    ***********************************************************/
    RIGHT,
}

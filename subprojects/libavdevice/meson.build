project ('org.ffmpeg.LibAV.Device', 'c', 'vala', version: '1.0.0')

srcs = files ([
    './main.vala',
    './v4l2-common.vapi',
    './decklink_common_c.vapi',
    './fbdev_common.vapi',
    './pulse_audio_common.vapi',
    './sndio.vapi',
    './version.vapi',
    './avdevice.vapi',
    './internal.vapi',
    './dshow_capture.vapi',
    './decklink_common.vapi',
    './opengl_enc_shaders.vapi',
    './oss.vapi',
    './timefilter.vapi',
    './decklink_dec.vapi',
    './alsa.vapi',
    './decklink_enc.vapi'
])

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),
    # dependency ('glib-2.0'),
    # subproject(
    #     'glib'
    # ).get_variable (
    #     'glib-2.0'
    # ),
    # subproject(
    #     'libavcodec'
    # ).get_variable (
    #     'libavcodec_dep'
    # ),
    subproject(
        'libavformat'
    ).get_variable (
        'libavformat_dep'
    ),
    subproject(
        'libavutil'
    ).get_variable (
        'libavutil_dep'
    ),
    # subproject(
    #     'libavfilter'
    # ).get_variable (
    #     'libavfilter_dep'
    # ),
    # subproject(
    #     'libavdevice'
    # ).get_variable (
    #     'libavdevice_dep'
    # ),
    # subproject(
    #     'libswresample'
    # ).get_variable (
    #     'libswresample_dep'
    # ),
    # subproject(
    #     'libswscale'
    # ).get_variable (
    #     'libswscale_dep'
    # )
]

libavdevice_lib = shared_library(
    meson.project_name(),
    srcs,
    install : true,
    dependencies : deps
)

libavdevice_dep = declare_dependency(
    link_with: libavdevice_lib,
    include_directories: include_directories('.')
)

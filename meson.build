project ('org.ffmpeg.FFmpeg', 'c', 'vala', version: '1.0.0')

srcs = files ([
    './main.vala'
])

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),
    # dependency ('glib-2.0'),
    # subproject(
    #     'glib'
    # ).get_variable (
    #     'glib-2.0'
    # ),
    subproject(
        'vapi'
    ).get_variable (
        'libavcodec_dep'
    ),
    subproject(
        'vapi'
    ).get_variable (
        'libavformat_dep'
    ),
    subproject(
        'vapi'
    ).get_variable (
        'libavutil_dep'
    ),
    subproject(
        'vapi'
    ).get_variable (
        'libavfilter_dep'
    ),
    # subproject(
    #     'vapi'
    # ).get_variable (
    #     'libavdevice_dep'
    # ),
    subproject(
        'vapi'
    ).get_variable (
        'libswresample_dep'
    ),
    subproject(
        'vapi'
    ).get_variable (
        'libswscale_dep'
    )
]

ffmpeg_lib = library(
    meson.project_name (),
    srcs,
    dependencies: deps,
    install: true
)

ffmpeg_dep = declare_dependency(
    link_with: ffmpeg_lib,
    include_directories: include_directories('.')
)

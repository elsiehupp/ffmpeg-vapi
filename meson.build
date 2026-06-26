project ('org.ffmpeg.FFmpeg', 'c', 'vala', version: '1.0.0')

srcs = files ()

subdir ('vapi')

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),
    # dependency ('glib-2.0'),
    # subproject(
    #     'glib'
    # ).get_variable (
    #     'glib-2.0'
    # ),
    # dependency ('gtk+-3.0'),
    subproject(
        'ffmpeg'
    ).get_variable (
        'declared_dep'
    )
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libavcodec'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libavformat'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libavutil'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libavfilter'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libavdevice'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libswresample'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'libswscale'
    # )
    # libavcodec-dev
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

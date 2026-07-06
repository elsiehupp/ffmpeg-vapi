project ('org.ffmpeg.Examples.DecodeFilterVideo', 'c', 'vala', version: '1.0.0')

srcs += ([
    './DecodeFilterVideoApplication.vala'
])

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),
    dependency ('glib-2.0'),
    # subproject(
    #     'glib'
    # ).get_variable (
    #     'glib-2.0'
    # ),
    # subproject(
    #     'ffmpeg'
    # ).get_variable (
    #     'declared_dep'
    # )
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
]

executable(
    'decode_filter_audio',
    srcs,
    link_with : deps
)

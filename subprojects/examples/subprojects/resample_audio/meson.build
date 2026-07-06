project ('org.ffmpeg.Examples.ResampleAudio', 'c', 'vala', version: '1.0.0')

srcs += ([
    './ResampleAudioApplication.vala'
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
    'resample_audio',
    srcs,
    link_with : deps
)

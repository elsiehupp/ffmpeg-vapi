project ('org.ffmpeg.Examples.ShowMetadata', 'c', 'vala', version: '1.0.0')

srcs += ([
    './ShowMetadataApplication.vala'
])

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),

    dependency ('glib-2.0'),
    dependency ('gio-2.0'),
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
    # subproject(
    #     'libavformat'
    # ).get_variable (
    #     'libavformat_dep'
    # ),
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

executable(
    'show_metadata',
    srcs,
    dependencies : deps
)

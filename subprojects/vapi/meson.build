project ('org.ffmpeg.LibAV', 'c', 'vala', version: '1.0.0')

srcs = files([])

# subproject ('libavcodec')
# subproject ('libavdevice')
subproject ('libavfilter')
subproject ('libavformat')
subproject ('libavresample')
subproject ('libavutil')
subproject ('libpostproc')
subproject ('libswresample')
subproject ('libswscale')

libavcodec_dep = subproject(
    'libavcodec'
).get_variable (
    'libavcodec_dep'
)

libavformat_dep = subproject(
    'libavformat'
).get_variable (
    'libavformat_dep'
)

libavutil_dep = subproject(
    'libavutil'
).get_variable (
    'libavutil_dep'
)

libavfilter_dep = subproject(
    'libavfilter'
).get_variable (
    'libavfilter_dep'
)

# libavdevice_dep = subproject(
#     'libavdevice'
# ).get_variable (
#     'libavdevice_dep'
# )

libswresample_dep = subproject(
    'libswresample'
).get_variable (
    'libswresample_dep'
)

libswscale_dep = subproject(
    'libswscale'
).get_variable (
    'libswscale_dep'
)

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),
    # dependency ('glib-2.0'),
    # subproject(
    #     'glib'
    # ).get_variable (
    #     'glib-2.0'
    # ),
    libavcodec_dep,
    libavformat_dep,
    libavutil_dep,
    libavfilter_dep,
    # libavdevice_dep,
    libswresample_dep,
    libswscale_dep
]

libav_lib = shared_library(
    meson.project_name(),
    srcs,
    install : true,
    dependencies : deps
)

libav_dep = declare_dependency(
    link_with: libav_lib,
    include_directories: include_directories('.')
)

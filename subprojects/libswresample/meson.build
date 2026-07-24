project ('org.ffmpeg.LibAV.SoftwareResample', 'c', 'vala', version: '1.0.0')

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

srcs = files ([
    './main.vala',
    './ResampleContext.vapi',
    './SoftwareResampleFilterType.vapi',
    './SoftwareResampleDitherType.vapi',
    './DitherContext.vapi',
    './SoftwareResampleEngine.vapi',
    './AudioConvert.vapi',
    './AudioData.vapi',
    './Resampler.vapi',
    './SoftwareContext.vapi',
    './SoftwareResampleFlags.vapi',
    './Version.vapi'
])

libswresample_lib = shared_library(
    meson.project_name(),
    srcs,
    install : true,
    dependencies : deps
)

libswresample_dep = declare_dependency(
    link_with: libswresample_lib,
    include_directories: include_directories('.')
)

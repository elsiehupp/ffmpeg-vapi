project ('org.ffmpeg.LibAV.Resample', 'c', 'vala', version: '1.0.0')

srcs = files ([
    './main.vala',
    './ResampleContext.vapi',
    './AudioMix.vapi',
    './ChannelMapInfo.vapi',
    './AudioMixCoeffType.vapi',
    './ResampleFilterType.vapi',
    './DitherContext.vapi',
    './RemapPoint.vapi',
    './AudioConvert.vapi',
    './AudioData.vapi',
    './AudioResampleContext.vapi',
    './ResampleDitherMethod.vapi',
    './DitherDSPContext.vapi'
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
    # subproject(
    #     'libavutil'
    # ).get_variable (
    #     'libavutil_dep'
    # ),
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

libavresample_lib = library(
    meson.project_name(),
    srcs,
    dependencies : deps
)

libavresample_dep = declare_dependency(
    link_with: libavresample_lib,
    include_directories: include_directories('.')
)

project ('org.ffmpeg.LibAV.SoftwareScale', 'c', 'vala', version: '1.0.0')

srcs = files ([
    './main.vala',
    './rgb2rgb.vapi',
    './SoftwareScaleSlice.vapi',
    './SoftwareScaleColorSpace.vapi',
    './SoftwareScaleFilter.vapi',
    './SoftwareScaleSlicePlane.vapi',
    './SoftwareScaleFilterDescriptor.vapi',
    './SoftwareScaleContext.vapi',
    './SoftwareScaleVector.vapi',
    './SoftwareScaleFlags.vapi',
    './SoftwareScaleAlphaBlendType.vapi',
    './SoftwareScaleDitherType.vapi',
    './swscale_internal.vapi'
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

libswscale_lib = library(
    meson.project_name(),
    srcs,
    dependencies : deps
)

libswscale_dep = declare_dependency(
    link_with: libswscale_lib,
    include_directories: include_directories('.')
)

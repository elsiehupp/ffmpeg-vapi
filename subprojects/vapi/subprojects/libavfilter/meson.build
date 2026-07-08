project ('org.ffmpeg.LibAV.Filter', 'c', 'vala', version: '1.0.0')

#include "libavutil/attributes.h"
#include "libavutil/avutil.h"
#include "libavutil/buffer.h"
#include "libavutil/dict.h"
#include "libavutil/frame.h"
#include "libavutil/log.h"
#include "libavutil/pixfmt.h"
#include "libavutil/rational.h"

srcs = files ([
    './main.vala',
    './Version.vapi',
    './avfilter/FilterPad.vapi',
    './avfilter/FilterContext.vapi',
    './avfilter/FilterThreadSliceFlags.vapi',
    './avfilter/FilterAutoConvertFlags.vapi',
    './avfilter/FilterCommandFlags.vapi',
    './avfilter/FilterGraphSegment.vapi',
    './avfilter/FilterLink.vapi',
    './avfilter/FilterFlags.vapi',
    './avfilter/FilterFormats.vapi',
    './avfilter/Filter.vapi',
    './avfilter/FilterInOut.vapi',
    './avfilter/FilterChain.vapi',
    './avfilter/FilterParams.vapi',
    './avfilter/FilterPadParams.vapi',
    './avfilter/FilterFormatsConfig.vapi',
    './avfilter/FilterGraph.vapi'
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

libavfilter_lib = library(
    meson.project_name(),
    srcs,
    dependencies : deps
)

libavfilter_dep = declare_dependency(
    link_with: libavfilter_lib,
    include_directories: include_directories('.')
)

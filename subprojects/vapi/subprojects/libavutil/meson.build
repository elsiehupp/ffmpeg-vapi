project ('org.ffmpeg.LibAV.Util', 'c', 'vala', version: '1.0.0')

#include "common.h"
#include "rational.h"
#include "version.h"
#include "macros.h"
#include "mathematics.h"
#include "log.h"
#include "pixfmt.h"

srcs = files ([
    './main.vala'
])

subdir('avutil')
# subdir('common')
# subdir('internal')
subdir('log')
subdir('macros')
# subdir('mathematics')
subdir('opt')
subdir('pixfmt')
subdir('rational')
subdir('version')

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

libavutil_lib = library(
    meson.project_name(),
    srcs,
    dependencies : deps
)

libavutil_dep = declare_dependency(
    link_with: libavutil_lib,
    include_directories: include_directories('.')
)

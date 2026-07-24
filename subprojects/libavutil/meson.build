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
subdir('dict')
# subdir('common')
# subdir('internal')
subdir('log')
subdir('macros')
# subdir('mathematics')
subdir('opt')
subdir('pixfmt')
subdir('rational')
subdir('samplefmt')
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
]

libavutil_lib = shared_library(
    meson.project_name(),
    srcs,
    install : true,
    dependencies : deps
)

libavutil_dep = declare_dependency(
    link_with: libavutil_lib,
    include_directories: include_directories('.')
)

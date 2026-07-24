project ('org.ffmpeg.FFmpeg', 'c', 'vala', version: '1.0.0')

srcs = files ([
    './main.vala'
])

deps = [
    # meson.get_compiler ('vala').find_library ('posix'),
    # dependency ('glib-2.0'),
    # subproject(
    #     'glib'
    # ).get_variable (
    #     'glib-2.0'
    # ),
    subproject(
        'libavcodec'
    ).get_variable (
        'libavcodec_dep'
    ),
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
    subproject(
        'libavfilter'
    ).get_variable (
        'libavfilter_dep'
    ),
    # subproject(
    #     'libavdevice'
    # ).get_variable (
    #     'libavdevice_dep'
    # ),
    subproject(
        'libswresample'
    ).get_variable (
        'libswresample_dep'
    ),
    subproject(
        'libswscale'
    ).get_variable (
        'libswscale_dep'
    )
]


subproject ('example_avio_http_serve_files')
subproject ('example_avio_list_dir')
subproject ('example_avio_read_callback')
subproject ('example_decode_audio')
subproject ('example_decode_filter_audio')
subproject ('example_decode_filter_video')
subproject ('example_decode_video')
subproject ('example_demux_decode')
subproject ('example_encode_audio')
subproject ('example_encode_video')
subproject ('example_extract_mvs')
subproject ('example_filter_audio')
subproject ('example_hw_decode')
subproject ('example_mux')
subproject ('example_qsv_decode')
subproject ('example_qsv_transcode')
subproject ('example_remux')
subproject ('example_resample_audio')
subproject ('example_scale_video')
subproject ('example_show_metadata')
subproject ('example_transcode')
subproject ('example_transcode_aac')
subproject ('example_vaapi_encode')
subproject ('example_vaapi_transcode')


ffmpeg_lib = shared_library(
    meson.project_name (),
    srcs,
    dependencies: deps,
    install: true
)

ffmpeg_dep = declare_dependency(
    link_with: ffmpeg_lib,
    include_directories: include_directories('.')
)

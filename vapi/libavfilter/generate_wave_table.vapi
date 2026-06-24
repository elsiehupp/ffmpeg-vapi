/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

[CCode (cname="enum WaveType",cheader_filename="subprojects/ffmpeg/libavfilter/generate_wave_table.h")]
public enum WaveType {
    [CCode (cname="WAVE_SIN",cheader_filename="subprojects/ffmpeg/libavfilter/generate_wave_table.h")]
    SIN,

    [CCode (cname="WAVE_TRI",cheader_filename="subprojects/ffmpeg/libavfilter/generate_wave_table.h")]
    TRI,

    [CCode (cname="WAVE_NB",cheader_filename="subprojects/ffmpeg/libavfilter/generate_wave_table.h")]
    NB;
}

[CCode (cname="ff_generate_wave_table",cheader_filename="subprojects/ffmpeg/libavfilter/generate_wave_table.h")]
public void ff_generate_wave_table (
    WaveType wave_type,
    AVSampleFormat sample_fmt,
    void *table,
    int table_size,
    double min,
    double max,
    double phase
);

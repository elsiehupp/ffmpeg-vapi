/***********************************************************
@copyright 2000, 2001, 2002 Fabrice Bellard
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {
[Flags]
[CCode (cprefix="AV_CPU_FLAG_", cheader_filename="ffmpeg/libavutil/cpu.h")]
public enum CPUCapabilityFlags {
    /***********************************************************
    @brief Force usage of selected flags (OR)
    ***********************************************************/
    FORCE,

    /***********************************************************
    lower 16 bits - CPU features
***********************************************************/

    /***********************************************************
    @brief Standard MMX
    ***********************************************************/
    MMX,
    /***********************************************************
    @brief SSE integer functions or AMD MMX ext
    ***********************************************************/
    MMXEXT,
    /***********************************************************
    @brief SSE integer functions or AMD MMX ext
    ***********************************************************/
    MMX2,
    /***********************************************************
    @brief SSE functions
    ***********************************************************/
    SSE,
    /***********************************************************
    @brief PIV SSE2 functions
    ***********************************************************/
    SSE2,
    /***********************************************************
    @brief SSE2 supported, but usually not faster than regular MMX/SSE
    (e.g. Core1)
    ***********************************************************/
    SSE2SLOW,
    /***********************************************************
    @brief AMD 3DNowExt
    ***********************************************************/
    3DNOWEXT,
    /***********************************************************
    @brief Prescott SSE3 functions
    ***********************************************************/
    SSE3,
    /***********************************************************
    @brief SSE3 supported, but usually not faster than regular MMX/SSE
    (e.g. Core1)
    ***********************************************************/
    SSE3SLOW,
    /***********************************************************
    @brief Conroe SSSE3 functions
    ***********************************************************/
    SSSE3,
    /***********************************************************
    @brief SSSE3 supported, but usually not faster
    ***********************************************************/
    SSSE3SLOW,
    /***********************************************************
    @brief Atom processor, some SSSE3 instructions are slower
    ***********************************************************/
    ATOM,
    /***********************************************************
    @brief Penryn SSE4.1 functions
    ***********************************************************/
    SSE4,
    /***********************************************************
    @brief Nehalem SSE4.2 functions
    ***********************************************************/
    SSE42,
    /***********************************************************
    @brief Advanced Encryption Standard functions
    ***********************************************************/
    AESNI,
    /***********************************************************
    @brief AVX functions: requires OS support even if YMM registers
    aren't used
    ***********************************************************/
    AVX,
    /***********************************************************
    @brief AVX supported, but slow when using YMM registers (e.g.
    Bulldozer)
    ***********************************************************/
    AVXSLOW,
    /***********************************************************
    @brief Bulldozer XOP functions
    ***********************************************************/
    XOP,
    /***********************************************************
    @brief Bulldozer FMA4 functions
    ***********************************************************/
    FMA4,
    /***********************************************************
    @brief Supports cmov instruction
    ***********************************************************/
    CMOV,
    /***********************************************************
    @brief AVX2 functions: requires OS support even if YMM registers
    aren't used
    ***********************************************************/
    AVX2,
    /***********************************************************
    @brief Haswell FMA3 functions
    ***********************************************************/
    FMA3,
    /***********************************************************
    @brief Bit Manipulation Instruction Set 1
    ***********************************************************/
    BMI1,
    /***********************************************************
    @brief Bit Manipulation Instruction Set 2
    ***********************************************************/
    BMI2,
    /***********************************************************
    @brief AVX-512 functions: requires OS support even if YMM/ZMM
    registers aren't used
    ***********************************************************/
    AVX512,

    /***********************************************************
    @brief Standard
    ***********************************************************/
    ALTIVEC,
    /***********************************************************
    @brief ISA 2.06
    ***********************************************************/
    VSX,
    /***********************************************************
    @brief ISA 2.07
    ***********************************************************/
    POWER8,

    ARMV5TE,
    ARMV6,
    ARMV6T2,
    VFP,
    VFPV3,
    NEON,
    ARMV8,
    /***********************************************************
    @brief VFPv2 vector mode, deprecated in ARMv7-A and unavailable in
    various CPUs implementations
    ***********************************************************/
    VFP_VM,
    SETEND;

    /***********************************************************
    @brief Return the flags which specify extensions supported by the CPU.
    The returned value is affected by av_force_cpu_flags () if that was used
    before. So av_get_cpu_flags () can easily be used in an application to
    detect the enabled cpu flags.
    ***********************************************************/
    [CCode (cname="av_get_cpu_flags", cheader_filename="ffmpeg/libavutil/cpu.h")]
    public static CPUCapabilityFlags av_get_cpu_flags ();

    /***********************************************************
    @brief Disables cpu detection and forces the specified flags.
    -1 is a special case that disables forcing of specific flags.
    ***********************************************************/
    [CCode (cname="av_force_cpu_flags", cheader_filename="ffmpeg/libavutil/cpu.h")]
    public static void av_force_cpu_flags (
        CPUCapabilityFlags flags
    );

    /***********************************************************
    @brief Parse CPU caps from a string and update the given CPUCapabilityFlags flags based on that.

    @return negative on error.
    ***********************************************************/
    [CCode (cname="av_parse_cpu_caps", cheader_filename="ffmpeg/libavutil/cpu.h")]
    public static int av_parse_cpu_caps (
        out CPUCapabilityFlags flags,
        string s
    );

    /***********************************************************
    @return the number of logical CPU cores present.
    ***********************************************************/
    [CCode (cname="av_cpu_count", cheader_filename="ffmpeg/libavutil/cpu.h")]
    public int av_cpu_count ();

    /***********************************************************
    @brief Get the maximum data alignment that may be required by FFmpeg.

    Note that this is affected by the build configuration and the CPU flags mask,
    so e.g. if the CPU supports AVX, but libavutil has been built with
    --disable-avx or the AVX flag has been disabled through
    av_set_cpu_flags_mask (), then this function will behave as if AVX is not
    present.
    ***********************************************************/
    [CCode (cname="av_cpu_max_align", cheader_filename="ffmpeg/libavutil/cpu.h")]
    public size_t av_cpu_max_align ();

}

} // namespace LibAVUtil

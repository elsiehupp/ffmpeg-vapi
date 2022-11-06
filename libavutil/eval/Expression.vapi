/***********************************************************
@copyright 2002 Michael Niedermayer <michaelni@gmx.at>

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

/***********************************************************
@file
simple arithmetic expression evaluator
***********************************************************/

public delegate double OneArgumentDelegate (
    void *arg0,
    double arg1
);

public delegate double TwoArgumentDelegate (
    void *arg0,
    double arg1,
    double arg2
);

[CCode (cname="struct AVExpr", cheader_filename="ffmpeg/libavutil/eval.h")]
public struct Expression {

    /***********************************************************
    @brief Parse and evaluate an expression.
    Note, this is significantly slower than av_expr_eval ().

    @param res a pointer to a double where is put the result value of
    the expression, or NAN in case of error
    @param s expression as a zero terminated string, for example "1+2^3+5*5+sin (2/3)"
    @param const_names null terminated array of zero terminated strings of constant identifiers, for example {"PI", "E", 0}
    @param const_values a zero terminated array of values for the identifiers from const_names
    @param func1_names null terminated array of zero terminated strings of funcs1 identifiers
    @param funcs1 null terminated array of function pointers for functions which take 1 argument
    @param func2_names null terminated array of zero terminated strings of funcs2 identifiers
    @param funcs2 null terminated array of function pointers for functions which take 2 arguments
    @param opaque a pointer which will be passed to all functions from funcs1 and funcs2
    @param log_ctx parent logging context
    @return >= 0 in case of success, a negative value corresponding to an
    LibAVUtil.ErrorCode code otherwise
    ***********************************************************/
    [CCode (cname="av_expr_parse_and_eval", cheader_filename="ffmpeg/libavutil/eval.h")]
    public int av_expr_parse_and_eval (
        out double res,
        string s,
        string[] const_names,
        double[] const_values,
        string[] func1_names,
        OneArgumentDelegate *funcs1,
        string[] func2_names,
        TwoArgumentDelegate *funcs2,
        void *opaque,
        int log_offset,
        void *log_ctx
    );

    /***********************************************************
    @brief Parse an expression.

    @param expr a pointer where is put an Expression containing the parsed
    value in case of successful parsing, or null otherwise.
    The pointed to Expression must be freed with av_expr_free () by the user
    when it is not needed anymore.
    @param s expression as a zero terminated string, for example "1+2^3+5*5+sin (2/3)"
    @param const_names null terminated array of zero terminated strings of constant identifiers, for example {"PI", "E", 0}
    @param func1_names null terminated array of zero terminated strings of funcs1 identifiers
    @param funcs1 null terminated array of function pointers for functions which take 1 argument
    @param func2_names null terminated array of zero terminated strings of funcs2 identifiers
    @param funcs2 null terminated array of function pointers for functions which take 2 arguments
    @param log_ctx parent logging context
    @return >= 0 in case of success, a negative value corresponding to an
    LibAVUtil.ErrorCode code otherwise
    ***********************************************************/
    [CCode (cname="av_expr_parse", cheader_filename="ffmpeg/libavutil/eval.h")]
    public int av_expr_parse (
        Expression expr,
        string s,
        string[] const_names,
        string[] func1_names,
        OneArgumentDelegate* funcs1,
        string[] func2_names,
        TwoArgumentDelegate* funcs2,
        int log_offset, void *log_ctx);

    /***********************************************************
    @brief Evaluate a previously parsed expression.

    @param const_values a zero terminated array of values for the identifiers from av_expr_parse () const_names
    @param opaque a pointer which will be passed to all functions from funcs1 and funcs2
    @return the value of the expression
    ***********************************************************/
    [CCode (cname="av_expr_eval", cheader_filename="ffmpeg/libavutil/eval.h")]
    public double av_expr_eval (
        Expression e,
        double const_values,
        void *opaque
    );

    /***********************************************************
    @brief Free a parsed expression previously created with av_expr_parse ().
    ***********************************************************/
    [CCode (cname="av_expr_free", cheader_filename="ffmpeg/libavutil/eval.h")]
    public void av_expr_free (
        Expression e
    );

    /***********************************************************
    @brief Parse the string in numstr and return its value as a double. If
    the string is empty, contains only whitespaces, or does not contain
    an initial substring that has the expected syntax for a
    floating-point number, no conversion is performed. In this case,
    returns a value of zero and the value returned in tail is the value
    of numstr.

    @param numstr a string representing a number, may contain one of
    the International System number postfixes, for example 'K', 'M',
    'G'. If 'i' is appended after the postfix, powers of 2 are used
    instead of powers of 10. The 'B' postfix multiplies the value by
    8, and can be appended after another postfix or used alone. This
    allows using for example 'KB', 'MiB', 'G' and 'B' as postfix.
    @param tail if non-null puts here the pointer to the char next
    after the last parsed character
    ***********************************************************/
    [CCode (cname="av_strtod", cheader_filename="ffmpeg/libavutil/eval.h")]
    public double av_strtod (
        string numstr,
        out char[] tail
    );
}

} // namespace LibAVUtil

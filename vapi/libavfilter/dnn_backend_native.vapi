/***********************************************************
Copyright (c) 2018 Sergey Lavrushkin

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

/***********************************************************
@file
DNN inference functions interface for native backend.
***********************************************************/

[CCode (cname="",cheader_filename="")]
public enum DNNLayerType {
    [CCode (cname="")]
    INPUT,

    [CCode (cname="")]
    CONV,

    [CCode (cname="")]
    DEPTH_TO_SPACE
}

[CCode (cname="",cheader_filename="")]
public enum DNNActivationFunc {
    [CCode (cname="")]
    RELU,

    [CCode (cname="")]
    TANH,

    [CCode (cname="")]
    SIGMOID,

    [CCode (cname="")]
    NONE,

    [CCode (cname="")]
    LEAKY_RELU
}

[CCode (cname="",cheader_filename="")]
public enum DNNConvPaddingParam {
    [CCode (cname="")]
    VALID,

    [CCode (cname="")]
    SAME,

    [CCode (cname="")]
    SAME_CLAMP_TO_EDGE
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class Layer {
    [CCode (cname="")]
    public DNNLayerType type;

    [CCode (cname="")]
    public float[] output;

    [CCode (cname="")]
    public void *params;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class ConvolutionalParams {
    [CCode (cname="")]
    public int32 input_num;

    [CCode (cname="")]
    public int32 output_num;

    [CCode (cname="")]
    public int32 kernel_size;

    [CCode (cname="")]
    public DNNActivationFunc activation;

    [CCode (cname="")]
    public DNNConvPaddingParam padding_method;

    [CCode (cname="")]
    public int32 dilation;

    [CCode (cname="")]
    public float[] kernel;

    [CCode (cname="")]
    public float[] biases;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class InputParams {
    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int channels;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class DepthToSpaceParams {
    [CCode (cname="")]
    public int block_size;
}

/***********************************************************
Represents simple feed-forward convolutional network.
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Compact]
public class ConvolutionalNetwork {
    public Layer? layers;

    [CCode (cname="")]
    public int32 layers_num;
}

[CCode (cname="",cheader_filename="")]
public DNNModel? ff_dnn_load_model_native (
    string model_filename
);

[CCode (cname="",cheader_filename="")]
public DNNReturnType ff_dnn_execute_model_native (
    DNNModel? model,
    DNNData? outputs,
    uint32 nb_output
);

[CCode (cname="",cheader_filename="")]
public void ff_dnn_free_model_native (
    DNNModel **model
);

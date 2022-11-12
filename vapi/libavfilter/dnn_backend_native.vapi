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

public enum DNNLayerType {
    INPUT,
    CONV,
    DEPTH_TO_SPACE
}

public enum DNNActivationFunc {
    RELU,
    TANH,
    SIGMOID,
    NONE,
    LEAKY_RELU
}

public enum DNNConvPaddingParam {
    VALID,
    SAME,
    SAME_CLAMP_TO_EDGE
}

public struct Layer {
    DNNLayerType type;
    float *output;
    void *params;
}

public struct ConvolutionalParams {
    int32 input_num, output_num, kernel_size;
    DNNActivationFunc activation;
    DNNConvPaddingParam padding_method;
    int32 dilation;
    float *kernel;
    float *biases;
}

public struct InputParams {
    int height, width, channels;
}

public struct DepthToSpaceParams {
    int block_size;
}

// Represents simple feed-forward convolutional network.
public struct ConvolutionalNetwork {
    Layer *layers;
    int32 layers_num;
}

DNNModel *ff_dnn_load_model_native (string model_filename);

DNNReturnType ff_dnn_execute_model_native (const DNNModel *model, DNNData *outputs, uint32 nb_output);

void ff_dnn_free_model_native (DNNModel **model);

#endif

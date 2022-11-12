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
DNN inference engine interface.
***********************************************************/

public enum DNNReturnType {
    DNN_SUCCESS,
    DNN_ERROR
}

public enum DNNBackendType {
    DNN_NATIVE,
    DNN_TF
}

public enum DNNDataType {
    DNN_FLOAT,
    DNN_UINT8
}

public struct DNNInputData {
    void *data;
    DNNDataType dt;
    int width, height, channels;
}

public struct DNNData {
    float *data;
    int width, height, channels;
}

public struct DNNModel {
    // Stores model that can be different for different backends.
    void *model;
    // Sets model input and output.
    // Should be called at least once before model execution.
    DNNReturnType (*set_input_output)(void *model, DNNInputData *input, string input_name, string *output_names, uint32 nb_output);
}

// Stores pointers to functions for loading, executing, freeing DNN models for one of the backends.
public struct DNNModule {
    // Loads model and parameters from given file. Returns NULL if it is not possible.
    DNNModel *(*load_model)(string model_filename);
    // Executes model with specified input and output. Returns DNN_ERROR otherwise.
    DNNReturnType (*execute_model)(const DNNModel *model, DNNData *outputs, uint32 nb_output);
    // Frees memory allocated for model.
    void (*free_model)(DNNModel **model);
}

// Initializes DNNModule depending on chosen backend.
DNNModule *ff_get_dnn_module (DNNBackendType backend_type);

#endif

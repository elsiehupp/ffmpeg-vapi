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

[CCode (cname="",cheader_filename="")]
public enum DNNReturnType {
    [CCode (cname="")]
    DNN_SUCCESS,

    [CCode (cname="")]
    DNN_ERROR;
}

[CCode (cname="",cheader_filename="")]
public enum DNNBackendType {
    [CCode (cname="")]
    DNN_NATIVE,

    [CCode (cname="")]
    DNN_TF;
}

[CCode (cname="",cheader_filename="")]
public enum DNNDataType {
    [CCode (cname="")]
    DNN_FLOAT,

    [CCode (cname="")]
    DNN_UINT8;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class DNNInputData {
    [CCode (cname="")]
    public void *data;

    [CCode (cname="")]
    public DNNDataType dt;

    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public int channels;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class DNNData {
    [CCode (cname="")]
    public float[] data;

    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public int channels;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class DNNModel {
    /***********************************************************
    Stores model that can be different for different backends.
    ***********************************************************/
    [CCode (cname="")]
    public void *model;

    public delegate DNNReturnType SetInputDelegate (
        void *model,
        DNNInputData? input,
        string input_name,
        string? output_names,
        uint32 nb_output
    );

    /***********************************************************
    Sets model input and output.
    Should be called at least once before model execution.
    ***********************************************************/
    [CCode (cname="")]
    public SetInputDelegate set_input_output;
}

/***********************************************************
Stores pointers to functions for loading, executing, freeing DNN models for one of the backends.
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Compact]
public class DNNModule {
    public delegate DNNModel LoadModelDelegate (
        string model_filename
    );

    /***********************************************************
    Loads model and parameters from given file. Returns NULL if it is not possible.
    ***********************************************************/
    [CCode (cname="")]
    public LoadModelDelegate load_model;

    public delegate DNNReturnType ExecuteModelDelegate (
        DNNModel? model,
        DNNData? outputs,
        uint32 nb_output
    );

    /***********************************************************
    Executes model with specified input and output. Returns DNN_ERROR otherwise.
    ***********************************************************/
    [CCode (cname="")]
    public ExecuteModelDelegate execute_model;

    public delegate void FreeModelDelegate (
        DNNModel **model
    );

    /***********************************************************
    Frees memory allocated for model.
    ***********************************************************/
    [CCode (cname="")]
    public FreeModelDelegate free_model;

}

/***********************************************************
Initializes DNNModule depending on chosen backend.
***********************************************************/
[CCode (cname="",cheader_filename="")]
public DNNModule? ff_get_dnn_module (
    DNNBackendType backend_type
);

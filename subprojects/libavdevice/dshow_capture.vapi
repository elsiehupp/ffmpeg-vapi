/***********************************************************
DirectShow capture interface
Copyright (c) 2010 Ramiro Polla

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
namespace LibAVDevice {

/***********************************************************
EC_DEVICE_LOST is not defined in MinGW dshow headers.
***********************************************************/
#if !EC_DEVICE_LOST
public const int EC_DEVICE_LOST; // 0x1f
#endif

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long ff_copy_dshow_media_type (
    AM_MEDIA_TYPE? dst,
    AM_MEDIA_TYPE? src
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void ff_print_VIDEO_STREAM_CONFIG_CAPS (
    VIDEO_STREAM_CONFIG_CAPS? caps
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void ff_print_AUDIO_STREAM_CONFIG_CAPS (
    AUDIO_STREAM_CONFIG_CAPS? caps
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void ff_print_AM_MEDIA_TYPE (
    AM_MEDIA_TYPE? type
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void ff_printGUID (
    GUID? g
);

//  extern const LibAVUtil.Log.Class? ff_dshow_context_class_ptr;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public static void dshowdebug (
    ...
);
//   {
//      ff_dlog (
//          &ff_dshow_context_class_ptr,
//          __VA_ARGS__
//      );
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public static inline void nothing (
    void *foo
); // {}

[CCode (cname="struct GUIDoffset",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class GUIDoffset {
    [CCode (cname="")]
    public GUID? iid;

    [CCode (cname="")]
    public int offset;
}

[CCode (cname="enum dshowDeviceType",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public enum DirectShowDeviceType {
    [CCode (cname="VideoDevice")]
    VIDEO_DEVICE, // = 0,

    [CCode (cname="AudioDevice")]
    AUDIO_DEVICE; // = 1;
}

[CCode (cname="enum dshowSourceFilterType",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public enum DirectShowSourceFilterType {
    [CCode (cname="VideoSourceDevice")]
    VIDEO_SOURCE_DEVICE, // = 0,

    [CCode (cname="AudioSourceDevice")]
    AUDIO_SOURCE_DEVICE; // = 1;
}

//  public define DECLARE_QUERYINTERFACE (
//      void *class,
//      ...
//  ) {
//      long WINAPI
//      class##_QueryInterface (class? this, GUID? riid, void **ppvObject)
//      {
//          struct GUIDoffset ifaces[] = __VA_ARGS__;
//          public int i;
//          dshowdebug (AV_STRINGIFY (class)"_QueryInterface (%p, %p, %p)\n", this, riid, ppvObject);
//          ff_printGUID (riid);
//          if (!ppvObject)
//              return E_POINTER;
//          for (i = 0; i < sizeof (ifaces)/sizeof (ifaces[0]); i++) {
//              if (IsEqualGUID (riid, ifaces[i].iid)) {
//                  void *obj = (void *) ((uint8[] ) this + ifaces[i].offset);
//                  class##_AddRef (this);
//                  dshowdebug ("\tfound %d with offset %d\n", i, ifaces[i].offset);
//                 ? ppvObject = (void *) obj;
//                  return S_OK;
//              }
//          }
//          dshowdebug ("\tE_NOINTERFACE\n");
//         ? ppvObject = NULL;
//          return E_NOINTERFACE;
//      }

//  }

//  public define DECLARE_ADDREF (
//      void *class
//  ) {
//      ulong WINAPI
//      class##_AddRef (class? this)
//      {
//          dshowdebug (AV_STRINGIFY (class)"_AddRef (%p)\t%ld\n", this, this->ref+1);
//          return InterlockedIncrement (&this->ref);
//      }

//  }

//  public define DECLARE_RELEASE (
//      void *class
//  ) {
//      ulong WINAPI
//      class##_Release (class? this)
//      {
//          long ref = InterlockedDecrement (&this->ref);
//          dshowdebug (AV_STRINGIFY (class)"_Release (%p)\t%ld\n", this, ref);
//          if (!ref)
//              class##_Destroy (this);
//          return ref;
//      }

//  }

//  public define DECLARE_DESTROY (
//      void *class,
//      void *func
//  ) {
//      void class##_Destroy (class? this)
//      {
//          dshowdebug (AV_STRINGIFY (class)"_Destroy (%p)\n", this);
//          func (this);
//          if (this) {
//              if (this->vtbl)
//                  CoTaskMemFree (this->vtbl);
//              CoTaskMemFree (this);
//          }
//      }

//  }

//  public define DECLARE_CREATE (
//      void *class,
//      void *setup,
//      ...
//  ) {
//      class? class##_Create (__VA_ARGS__)
//      {
//          class? this = CoTaskMemAlloc (sizeof (class));
//          void *vtbl = CoTaskMemAlloc (sizeof (*this->vtbl));
//          dshowdebug (AV_STRINGIFY (class)"_Create (%p)\n", this);
//          if (!this || !vtbl)
//              goto fail;
//          ZeroMemory (this, sizeof (class));
//          ZeroMemory (vtbl, sizeof (*this->vtbl));
//          this->ref = 1;
//          this->vtbl = vtbl;
//          if (!setup)
//              goto fail;
//          dshowdebug ("created "AV_STRINGIFY (class)" %p\n", this);
//          return this;
//      fail:
//          class##_Destroy (this);
//          dshowdebug ("could not create "AV_STRINGIFY (class)"\n");
//          return NULL;
//      }

//  }

//  public define SETVTBL (
//      void *vtbl,
//      void *class,
//      void *fn
//  ) {
//      (vtbl)->fn = (void *) class##_##fn;
//  }

/*****************************************************************************
LibAVPin
****************************************************************************/
[CCode (cname="struct libAVPin",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVPin {
    [CCode (cname="")]
    public IPinVtbl? vtbl;

    [CCode (cname="")]
    public long ref;

    [CCode (cname="")]
    public LibAVFilter? filter;

    [CCode (cname="")]
    public IPin? connectedto;

    [CCode (cname="")]
    public AM_MEDIA_TYPE type;

    [CCode (cname="")]
    public IMemInputPinVtbl? imemvtbl;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_QueryInterface (
    LibAVPin? lib_av_pin,
    GUID? guid,
    out void *data
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVPin_AddRef (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVPin_Release (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_Connect (
    LibAVPin? lib_av_pin,
    IPin? ipin,
    AM_MEDIA_TYPE? media_type
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_ReceiveConnection (
    LibAVPin? lib_av_pin,
    IPin? ipin,
    AM_MEDIA_TYPE? media_type
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_Disconnect (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_ConnectedTo (
    LibAVPin? lib_av_pin,
    out IPin? ipin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_ConnectionMediaType (
    LibAVPin? lib_av_pin,
    AM_MEDIA_TYPE? media_type
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_QueryPinInfo (
    LibAVPin? lib_av_pin,
    PIN_INFO? pin_info
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_QueryDirection (
    LibAVPin? lib_av_pin,
    PIN_DIRECTION? pin_direction
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_QueryId (
    LibAVPin? lib_av_pin,
    out wchar_t[] wcharp
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_QueryAccept (
    LibAVPin? lib_av_pin,
    AM_MEDIA_TYPE? media_type
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_EnumMediaTypes (
    LibAVPin? lib_av_pin,
    out IEnumMediaTypes? ienum
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_QueryInternalConnections (
    LibAVPin? lib_av_pin,
    out IPin? ipin,
    out ulong value_out
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_EndOfStream (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_BeginFlush (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_EndFlush (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVPin_NewSegment (
    LibAVPin? lib_av_pin,
    REFERENCE_TIME time_1,
    REFERENCE_TIME time_2,
    double value
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_QueryInterface (
    LibAVMemInputPin? lib_av_mem_input_pin,
    GUID? guid,
    out void *private_data
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVMemInputPin_AddRef (
    LibAVMemInputPin? lib_av_mem_input_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVMemInputPin_Release (
    LibAVMemInputPin? lib_av_mem_input_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_GetAllocator (
    LibAVMemInputPin? lib_av_mem_input_pin,
    out IMemAllocator? imem
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_NotifyAllocator (
    LibAVMemInputPin? lib_av_mem_input_pin,
    IMemAllocator? imem,
    BOOL value
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_GetAllocatorRequirements (
    LibAVMemInputPin? lib_av_mem_input_pin,
    ALLOCATOR_PROPERTIES? properties
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_Receive (
    LibAVMemInputPin? lib_av_mem_input_pin,
    IMediaSample? sample
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_ReceiveMultiple (
    LibAVMemInputPin? lib_av_mem_input_pin,
    out IMediaSample? sample,
    long value,
    out long value_out
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVMemInputPin_ReceiveCanBlock (
    LibAVMemInputPin? lib_av_mem_input_pin
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVPin_Destroy (
    LibAVPin? lib_av_pin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public LibAVPin? libAVPin_Create (
    LibAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVMemInputPin_Destroy (
    LibAVMemInputPin? lib_av_mem_input_pin
);


/*****************************************************************************
LibAVEnumPins
****************************************************************************/
[CCode (cname="struct libAVEnumPins",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVEnumPins {
    [CCode (cname="")]
    public IEnumPinsVtbl? vtbl;

    [CCode (cname="")]
    public long ref;

    [CCode (cname="")]
    public int pos;

    [CCode (cname="")]
    public LibAVPin? pin;

    [CCode (cname="")]
    public LibAVFilter? filter;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumPins_QueryInterface (
    LibAVEnumPins? enum_pins,
    GUID? guid,
    out void *data
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVEnumPins_AddRef (
    LibAVEnumPins? enum_pins
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVEnumPins_Release (
    LibAVEnumPins? enum_pins
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumPins_Next (
    LibAVEnumPins? enum_pins,
    ulong value,
    out IPin? ipin,
    out ulong value_out
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumPins_Skip (
    LibAVEnumPins? enum_pins,
    ulong value
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumPins_Reset (
    LibAVEnumPins? enum_pins
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumPins_Clone (
    LibAVEnumPins? enum_pins,
    out LibAVEnumPins? clone
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVEnumPins_Destroy (
    LibAVEnumPins? enum_pins
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public LibAVEnumPins? libAVEnumPins_Create (
    LibAVPin? pin,
    LibAVFilter? filter
);

/*****************************************************************************
libAVEnumMediaTypes
****************************************************************************/
[CCode (cname="struct libAVEnumMediaTypes",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVEnumMediaTypes {
    [CCode (cname="")]
    public IEnumMediaTypesVtbl? vtbl;

    [CCode (cname="")]
    public long ref;

    [CCode (cname="")]
    public int pos;

    [CCode (cname="")]
    public AM_MEDIA_TYPE type;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumMediaTypes_QueryInterface (
    LibAVEnumMediaTypes? lib_av_enum_media_types,
    GUID? guid,
    out void *data
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVEnumMediaTypes_AddRef (
    LibAVEnumMediaTypes? lib_av_enum_media_types
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVEnumMediaTypes_Release (
    LibAVEnumMediaTypes? lib_av_enum_media_types
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumMediaTypes_Next (
    LibAVEnumMediaTypes? lib_av_enum_media_types,
    ulong value_in,
    ref AM_MEDIA_TYPE[] media_type_array,
    out ulong value_out
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumMediaTypes_Skip (
    LibAVEnumMediaTypes? lib_av_enum_media_types,
    ulong value
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumMediaTypes_Reset (
    LibAVEnumMediaTypes? lib_av_enum_media_types
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVEnumMediaTypes_Clone (
    LibAVEnumMediaTypes? lib_av_enum_media_types,
    out libAVEnumMediaTypes? clone
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVEnumMediaTypes_Destroy (
    LibAVEnumMediaTypes? lib_av_enum_media_types
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public libAVEnumMediaTypes? libAVEnumMediaTypes_Create (
    AM_MEDIA_TYPE? type
);

/*****************************************************************************
LibAVFilter
****************************************************************************/
[CCode (cname="struct libAVFilter",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVFilter {
    [CCode (cname="")]
    public IBaseFilterVtbl? vtbl;

    [CCode (cname="")]
    public long ref;

    [CCode (cname="")]
    public wchar_t[] name;

    [CCode (cname="")]
    public LibAVPin? pin;

    [CCode (cname="")]
    public FILTER_INFO info;

    [CCode (cname="")]
    public FILTER_STATE state;

    [CCode (cname="")]
    public IReferenceClock? clock;

    [CCode (cname="")]
    public DirectShowDeviceType type;

    [CCode (cname="")]
    public void *priv_data;

    [CCode (cname="")]
    public int stream_index;

    [CCode (cname="")]
    public int64 start_time;

    public delegate void CallbackDelegate (
        void *priv_data,
        int index,
        uint8[] buf,
        int buf_size,
        int64 time,
        DirectShowDeviceType type
    );

    [CCode (cname="callback")]
    public CallbackDelegate callback;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_QueryInterface (
    LibAVFilter? filter,
    GUID? guid,
    out void *data
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVFilter_AddRef (
    LibAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong /*WINAPI*/ libAVFilter_Release (
    LibAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_GetClassID (
    LibAVFilter? filter,
    CLSID? clsid
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_Stop (
    LibAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_Pause (
    LibAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_Run (
    LibAVFilter? filter,
    REFERENCE_TIME reference_time
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_GetState (
    LibAVFilter? filter,
    DWORD dword,
    FILTER_STATE? filter_state
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_SetSyncSource (
    LibAVFilter? filter,
    IReferenceClock? clock
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_GetSyncSource (
    LibAVFilter? filter,
    out IReferenceClock? clock
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_EnumPins (
    LibAVFilter? filter,
    out IEnumPins? ienumpins
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_FindPin (
    LibAVFilter? filter,
    wchar_t[] wcharp,
    out IPin? ipin
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_QueryFilterInfo (
    LibAVFilter? filter,
    FILTER_INFO? filter_info
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_JoinFilterGraph (
    LibAVFilter? filter,
    IFilterGraph? graph,
    wchar_t[] wcharp
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long /*WINAPI*/ libAVFilter_QueryVendorInfo (
    LibAVFilter? filter,
    out wchar_t[] wcharp
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVFilter_Destroy (
    LibAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public LibAVFilter? libAVFilter_Create (
    void *data_1,
    void *data_2,
    DirectShowDeviceType type
);

/*****************************************************************************
dshow_ctx
****************************************************************************/
[CCode (cname="struct dshow_ctx",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class dshow_ctx {
    [CCode (cname="class")]
    public LibAVUtil.Log.Class av_class;

    [CCode (cname="")]
    public IGraphBuilder? graph;

    [CCode (cname="")]
    public string device_name[2];

    [CCode (cname="")]
    public string device_unique_name[2];

    [CCode (cname="")]
    public int video_device_number;

    [CCode (cname="")]
    public int audio_device_number;

    [CCode (cname="")]
    public int list_options;

    [CCode (cname="")]
    public int list_devices;

    [CCode (cname="")]
    public int audio_buffer_size;

    [CCode (cname="")]
    public int crossbar_video_input_pin_number;

    [CCode (cname="")]
    public int crossbar_audio_input_pin_number;

    [CCode (cname="")]
    public string video_pin_name;

    [CCode (cname="")]
    public string audio_pin_name;

    [CCode (cname="")]
    public int show_video_device_dialog;

    [CCode (cname="")]
    public int show_audio_device_dialog;

    [CCode (cname="")]
    public int show_video_crossbar_connection_dialog;

    [CCode (cname="")]
    public int show_audio_crossbar_connection_dialog;

    [CCode (cname="")]
    public int show_analog_tv_tuner_dialog;

    [CCode (cname="")]
    public int show_analog_tv_tuner_audio_dialog;

    [CCode (cname="")]
    public string audio_filter_load_file;

    [CCode (cname="")]
    public string audio_filter_save_file;

    [CCode (cname="")]
    public string video_filter_load_file;

    [CCode (cname="")]
    public string video_filter_save_file;

    [CCode (cname="")]
    public IBaseFilter? device_filter[2];

    [CCode (cname="")]
    public IPin? device_pin[2];

    [CCode (cname="")]
    public LibAVFilter? capture_filter[2];

    [CCode (cname="")]
    public LibAVPin? capture_pin[2];

    [CCode (cname="")]
    public HANDLE mutex;

    /***********************************************************
    event[0] is set by DirectShow
    event[1] is set by callback ()
    ***********************************************************/
    [CCode (cname="")]
    public HANDLE event[2];

    [CCode (cname="")]
    public LibAVFormat.PacketList? pktl;

    [CCode (cname="")]
    public int eof;

    [CCode (cname="")]
    public int64 curbufsize[2];

    [CCode (cname="")]
    public uint video_frame_num;

    [CCode (cname="")]
    public IMediaControl? control;

    [CCode (cname="")]
    public IMediaEvent? media_event;

    [CCode (cname="")]
    public LibAVUtil.PixelFormat pixel_format;

    [CCode (cname="")]
    public LibAVCodec.CodecID video_codec_id;

    [CCode (cname="")]
    public string framerate;

    [CCode (cname="")]
    public int requested_width;

    [CCode (cname="")]
    public int requested_height;

    [CCode (cname="")]
    public LibAVUtil.Rational requested_framerate;

    [CCode (cname="")]
    public int sample_rate;

    [CCode (cname="")]
    public int sample_size;

    [CCode (cname="")]
    public int channels;
}

/*****************************************************************************
CrossBar
****************************************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public HRESULT dshow_try_setup_crossbar_options (
    ICaptureGraphBuilder2? graph_builder2,
    IBaseFilter? device_filter,
    DirectShowDeviceType devtype,
    LibAVFormat.FormatContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void dshow_show_filter_properties (
    IBaseFilter? pFilter,
    LibAVFormat.FormatContext? avctx
);

} // namespace LibAVDevice

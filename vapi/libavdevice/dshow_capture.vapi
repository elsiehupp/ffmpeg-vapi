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

//  extern const AVClass? ff_dshow_context_class_ptr;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public static void dshowdebug (
    ...
) {
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
Forward Declarations
****************************************************************************/
[CCode (cname="struct libAVPin",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVPin { }

[CCode (cname="struct libAVMemInputPin",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVMemInputPin { }

[CCode (cname="struct libAVEnumPins",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVEnumPins { }

[CCode (cname="struct libAVEnumMediaTypes",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVEnumMediaTypes { }

[CCode (cname="struct libAVFilter",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVFilter { }

/*****************************************************************************
libAVPin
****************************************************************************/
[CCode (cname="struct libAVPin",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVPin {
    [CCode (cname="")]
    public IPinVtbl? vtbl;

    [CCode (cname="")]
    public long ref;

    [CCode (cname="")]
    public libAVFilter? filter;

    [CCode (cname="")]
    public IPin? connectedto;

    [CCode (cname="")]
    public AM_MEDIA_TYPE type;

    [CCode (cname="")]
    public IMemInputPinVtbl? imemvtbl;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_QueryInterface (
    libAVPin *,
    GUID *,
    void **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVPin_AddRef (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVPin_Release (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_Connect (
    libAVPin *,
    IPin *,
    AM_MEDIA_TYPE *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_ReceiveConnection (
    libAVPin *,
    IPin *,
    AM_MEDIA_TYPE *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_Disconnect (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_ConnectedTo (
    libAVPin *,
    IPin **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_ConnectionMediaType (
    libAVPin *,
    AM_MEDIA_TYPE *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_QueryPinInfo (
    libAVPin *,
    PIN_INFO *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_QueryDirection (
    libAVPin *,
    PIN_DIRECTION *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_QueryId (
    libAVPin *,
    wchar_t **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_QueryAccept (
    libAVPin *,
    AM_MEDIA_TYPE *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_EnumMediaTypes (
    libAVPin *,
    IEnumMediaTypes **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_QueryInternalConnections (
    libAVPin *,
    IPin **,
    ulong *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_EndOfStream (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_BeginFlush (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_EndFlush (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVPin_NewSegment (
    libAVPin *,
    REFERENCE_TIME,
    REFERENCE_TIME,
    double
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_QueryInterface (
    libAVMemInputPin *,
    GUID *,
    void **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVMemInputPin_AddRef (
    libAVMemInputPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVMemInputPin_Release (
    libAVMemInputPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_GetAllocator (
    libAVMemInputPin *,
    IMemAllocator **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_NotifyAllocator (
    libAVMemInputPin *,
    IMemAllocator *,
    BOOL
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_GetAllocatorRequirements (
    libAVMemInputPin *,
    ALLOCATOR_PROPERTIES *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_Receive (
    libAVMemInputPin *,
    IMediaSample *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_ReceiveMultiple (
    libAVMemInputPin *,
    IMediaSample **,
    long,
    long *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVMemInputPin_ReceiveCanBlock (
    libAVMemInputPin *
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVPin_Destroy (
    libAVPin *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public libAVPin? libAVPin_Create (
    libAVFilter? filter
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVMemInputPin_Destroy (
    libAVMemInputPin *
);


/*****************************************************************************
libAVEnumPins
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
    public libAVPin? pin;

    [CCode (cname="")]
    public libAVFilter? filter;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumPins_QueryInterface (
    libAVEnumPins *,
    GUID *,
    void **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVEnumPins_AddRef (
    libAVEnumPins *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVEnumPins_Release (
    libAVEnumPins *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumPins_Next (
    libAVEnumPins *,
    ulong,
    IPin **,
    ulong *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumPins_Skip (
    libAVEnumPins *,
    ulong
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumPins_Reset (
    libAVEnumPins *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumPins_Clone (
    libAVEnumPins *,
    libAVEnumPins **
);


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVEnumPins_Destroy (
    libAVEnumPins *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public libAVEnumPins? libAVEnumPins_Create (
    libAVPin? pin,
    libAVFilter? filter
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
public long WINAPI libAVEnumMediaTypes_QueryInterface (
    libAVEnumMediaTypes *,
    GUID *,
    void **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVEnumMediaTypes_AddRef (
    libAVEnumMediaTypes *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVEnumMediaTypes_Release (
    libAVEnumMediaTypes *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumMediaTypes_Next (
    libAVEnumMediaTypes *,
    ulong,
    AM_MEDIA_TYPE **,
    ulong *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumMediaTypes_Skip (
    libAVEnumMediaTypes *,
    ulong
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumMediaTypes_Reset (
    libAVEnumMediaTypes *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVEnumMediaTypes_Clone (
    libAVEnumMediaTypes *,
    libAVEnumMediaTypes **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVEnumMediaTypes_Destroy (
    libAVEnumMediaTypes *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public libAVEnumMediaTypes? libAVEnumMediaTypes_Create (
    AM_MEDIA_TYPE? type
);

/*****************************************************************************
libAVFilter
 ****************************************************************************/
[CCode (cname="struct libAVFilter",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class LibAVFilter {
    [CCode (cname="")]
    public IBaseFilterVtbl? vtbl;

    [CCode (cname="")]
    public long ref;

    [CCode (cname="")]
    public const wchar_t? name;

    [CCode (cname="")]
    public libAVPin? pin;

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
public long WINAPI libAVFilter_QueryInterface (
    libAVFilter *,
    GUID *,
    void **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVFilter_AddRef (
    libAVFilter *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public ulong WINAPI libAVFilter_Release (
    libAVFilter *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_GetClassID (
    libAVFilter *,
    CLSID *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_Stop (
    libAVFilter *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_Pause (
    libAVFilter *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_Run (
    libAVFilter *,
    REFERENCE_TIME
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_GetState (
    libAVFilter *,
    DWORD,
    FILTER_STATE *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_SetSyncSource (
    libAVFilter *,
    IReferenceClock *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_GetSyncSource (
    libAVFilter *,
    IReferenceClock **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_EnumPins (
    libAVFilter *,
    IEnumPins **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_FindPin (
    libAVFilter *,
    wchar_t *,
    IPin **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_QueryFilterInfo (
    libAVFilter *,
    FILTER_INFO *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_JoinFilterGraph (
    libAVFilter *,
    IFilterGraph *,
    wchar_t *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public long WINAPI libAVFilter_QueryVendorInfo (
    libAVFilter *,
    wchar_t **
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void libAVFilter_Destroy (
    libAVFilter *
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public libAVFilter? libAVFilter_Create (
    void *,
    void *,
    DirectShowDeviceType
);

/*****************************************************************************
dshow_ctx
 ****************************************************************************/
[CCode (cname="struct dshow_ctx",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
[Compact]
public class dshow_ctx {
    [CCode (cname="class")]
    public AVClass av_class;

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
    public libAVFilter? capture_filter[2];

    [CCode (cname="")]
    public libAVPin? capture_pin[2];

    [CCode (cname="")]
    public HANDLE mutex;

    /***********************************************************
    event[0] is set by DirectShow
    event[1] is set by callback ()
    ***********************************************************/
    [CCode (cname="")]
    public HANDLE event[2];

    [CCode (cname="")]
    public AVPacketList? pktl;

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
    public AVPixelFormat pixel_format;

    [CCode (cname="")]
    public AVCodecID video_codec_id;

    [CCode (cname="")]
    public string framerate;

    [CCode (cname="")]
    public int requested_width;

    [CCode (cname="")]
    public int requested_height;

    [CCode (cname="")]
    public AVRational requested_framerate;

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
    AVFormatContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/dshow_capture.h")]
public void dshow_show_filter_properties (
    IBaseFilter? pFilter,
    AVFormatContext? avctx
);

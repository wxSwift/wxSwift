
#include <stdint.h>
#include <time.h>

const int wxID_ANY = -1;
#define wxCAPTION               0x20000000
#define wxCLIP_CHILDREN         0x00400000

// style common to both wxFrame and wxDialog
#define wxSTAY_ON_TOP           0x8000
#define wxICONIZE               0x4000
#define wxMINIMIZE              wxICONIZE
#define wxMAXIMIZE              0x2000
#define wxCLOSE_BOX             0x1000  // == wxHELP so can't be used with it

#define wxSYSTEM_MENU           0x0800
#define wxMINIMIZE_BOX          0x0400
#define wxMAXIMIZE_BOX          0x0200

#define wxTINY_CAPTION          0x0080  // clashes with wxNO_DEFAULT
#define wxRESIZE_BORDER         0x0040  // == wxCLOSE

#if WXWIN_COMPATIBILITY_2_8
// HORIZ and VERT styles are equivalent anyhow so don't use different names
// for them
#define wxTINY_CAPTION_HORIZ    wxTINY_CAPTION
#define wxTINY_CAPTION_VERT     wxTINY_CAPTION
#endif

// default style
const int wxDEFAULT_FRAME_STYLE = \
            (wxSYSTEM_MENU | \
             wxRESIZE_BORDER | \
             wxMINIMIZE_BOX | \
             wxMAXIMIZE_BOX | \
             wxCLOSE_BOX | \
             wxCAPTION | \
             wxCLIP_CHILDREN);


#ifndef WXUSINGDLL
#define WXUSINGDLL
#endif

#ifndef _UNICODE
#define _UNICODE
#endif

#define wxUSE_UNICODE

extern "C" {
#include "C:/Work/wxSwift/wxc/src/include/wxc.h"
}

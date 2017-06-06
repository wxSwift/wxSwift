
public var ID_ANY : Int32 = -1
public var DEFAULT_FRAME_STYLE : Int32 = 541072960
public var TAB_TRAVERSAL : Int32 = 0x00080000

public var STAY_ON_TOP : Int32 = 0x8000
public var ICONIZE     : Int32 = 0x4000
public var MINIMIZE    : Int32 = ICONIZE
public var MAXIMIZE    : Int32 = 0x2000
public var CLOSE_BOX   : Int32 = 0x1000  // == wxHELP so can't be used with it

public var SYSTEM_MENU : Int32 = 0x0800
public var MINIMIZE_BOX: Int32 = 0x0400
public var MAXIMIZE_BOX: Int32 = 0x0200

public var TINY_CAPTION: Int32 = 0x0080  // clashes with wxNO_DEFAULT
public var RESIZE_BORDER: Int32 = 0x0040  // == wxCLOSE

// style
public var BORDER_DEFAULT: Int32 = 0
public var BORDER_NONE   : Int32 = 0x00200000
public var BORDER_STATIC : Int32 = 0x01000000
public var BORDER_SIMPLE : Int32 = 0x02000000
public var BORDER_RAISED : Int32 = 0x04000000
public var BORDER_SUNKEN : Int32 = 0x08000000
public var BORDER_DOUBLE : Int32 = 0x10000000 // deprecated
public var BORDER_THEME  : Int32 = BORDER_DOUBLE
public var BORDER_MASK   : Int32 = 0x1f200000

// textctrl
public var TE_NO_VSCROLL : Int32 = 0x0002
public var TE_READONLY   : Int32 = 0x0010
public var TE_MULTILINE  : Int32 = 0x0020
public var TE_PROCESS_TAB: Int32 = 0x0040

// bitmap
public var BITMAP_TYPE_BMP: Int32 = 1
public var BITMAP_TYPE_BMP_RESOURCE: Int32 = 2
public var BITMAP_TYPE_ICO: Int32 = 3
public var BITMAP_TYPE_ICO_RESOURCE: Int32 = 4
public var BITMAP_TYPE_PNG: Int32 = 15
public var BITMAP_TYPE_PNG_RESOURCE: Int32 = 16
public var BITMAP_TYPE_ANY: Int32 = 50
// MSW
public var ICON_DEFAULT_TYPE = BITMAP_TYPE_ICO_RESOURCE


// font
public var FONTENCODING_DEFAULT: Int32 = 0
public var FONTFAMILY_MODERN   : Int32 = 75
public var DECORATIVE          : Int32 = 71
public var NORMAL              : Int32 = 90
public var BOLD                : Int32 = 92

// event
public var EVT_BUTTON       : Int32 = _wxc_expEVT_COMMAND_BUTTON_CLICKED()
public var EVT_ENTER_WINDOW : Int32 = _wxc_expEVT_ENTER_WINDOW()
public var EVT_LEAVE_WINDOW : Int32 = _wxc_expEVT_LEAVE_WINDOW()
public var EVT_LEFT_DCLICK  : Int32 = _wxc_expEVT_LEFT_DCLICK()

// file
public var FD_OPEN            : Int32 = 0x0001
public var FD_FILE_MUST_EXIST : Int32 = 0x0010

// Standard button and menu IDs
public var ID_OK     : Int32 = 5100
public var ID_CANCEL : Int32  = 5101

// for dialog
public var YES      : Int32  = 0x00000002
public var OK       : Int32  = 0x00000004
public var NO       : Int32  = 0x00000008
public var YES_NO   : Int32  = (YES | NO)
public var CANCEL   : Int32  = 0x00000010
public var APPLY    : Int32  = 0x00000020
public var CLOSE    : Int32  = 0x00000040

public var NullColour : Colour = Colour(_wxc_Null_Colour())

// for process
public var EXEC_ASYNC : Int32  = 0
public var EXEC_SYNC  : Int32  = 1

// FAKE
public var DefaultValidator: Int32 = 0


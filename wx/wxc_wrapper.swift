
public typealias VoidPtr = UnsafeMutableRawPointer?
public typealias WCharPtrPtr = UnsafeMutablePointer<UnsafeMutablePointer<UInt16>?>?
public typealias ConstCharPtr = UnsafePointer<Int8>?
public typealias CharPtr = UnsafeMutablePointer<Int8>?

// typedef void (*ClosureFun)( void* _fun, void* _data, void* _evt );
public typealias ClosureFun = @convention(c) (VoidPtr, VoidPtr, VoidPtr) -> Void

// int expEVT_COMMAND_MENU_SELECTED();
@_silgen_name("expEVT_COMMAND_MENU_SELECTED")
fileprivate func expEVT_COMMAND_MENU_SELECTED() -> CInt
public func _wxc_expEVT_COMMAND_MENU_SELECTED() -> Int32 {
  return expEVT_COMMAND_MENU_SELECTED()
}

// int expEVT_COMMAND_BUTTON_CLICKED();
@_silgen_name("expEVT_COMMAND_BUTTON_CLICKED")
fileprivate func expEVT_COMMAND_BUTTON_CLICKED() -> CInt
public func _wxc_expEVT_COMMAND_BUTTON_CLICKED() -> Int32 {
  return expEVT_COMMAND_BUTTON_CLICKED()
}

// int expEVT_ENTER_WINDOW();
@_silgen_name("expEVT_ENTER_WINDOW")
fileprivate func expEVT_ENTER_WINDOW() -> CInt
public func _wxc_expEVT_ENTER_WINDOW() -> Int32 {
  return expEVT_ENTER_WINDOW()
}

// int expEVT_LEAVE_WINDOW();
@_silgen_name("expEVT_LEAVE_WINDOW")
fileprivate func expEVT_LEAVE_WINDOW() -> CInt
public func _wxc_expEVT_LEAVE_WINDOW() -> Int32 {
  return expEVT_LEAVE_WINDOW()
}

// int expEVT_LEFT_DCLICK();
@_silgen_name("expEVT_LEFT_DCLICK")
fileprivate func expEVT_LEFT_DCLICK() -> CInt
public func _wxc_expEVT_LEFT_DCLICK() -> Int32 {
  return expEVT_LEFT_DCLICK()
}

// TClass(wxColour) Null_Colour(  );
@_silgen_name("Null_Colour")
fileprivate func Null_Colour() -> VoidPtr
public func _wxc_Null_Colour() -> VoidPtr {
  return Null_Colour()
}

// TClass(wxFrame) wxFrame_Create( TClass(wxWindow) _prt, int _id, TClass(wxString) _txt, TRect(_lft,_top,_wdt,_hgt), int _stl );
@_silgen_name("wxFrame_Create")
fileprivate func wxFrame_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_Frame_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxFrame_Create(_prt, _id, _txt, _lft, _top, _wdt, _hgt, _stl)
}

// TBool      wxWindow_Show( TSelf(wxWindow) _obj );
@_silgen_name("wxWindow_Show")
fileprivate func wxWindow_Show(_ _obj: VoidPtr) -> Int32
public func _wxc_Window_Show(_ _obj: VoidPtr) -> Int32 {
  return wxWindow_Show(_obj)
}

// TClass(wxString) wxString_CreateUTF8(const char* buffer);
@_silgen_name("wxString_CreateUTF8")
fileprivate func wxString_CreateUTF8(_ buffer: ConstCharPtr) -> VoidPtr
public func _wxc_String_CreateUTF8(_ buffer: ConstCharPtr) -> VoidPtr {
  return wxString_CreateUTF8(buffer)
}

// TClass(wxClosure)  wxClosure_Create( TClosureFun _fun_CEvent, void* _data );
@_silgen_name("wxClosure_Create")
fileprivate func wxClosure_Create(_ _fun_CEvent: ClosureFun, _ _data: VoidPtr) -> VoidPtr
public func _wxc_Closure_Create(_ _fun_CEvent: ClosureFun, _ _data: VoidPtr) -> VoidPtr {
  return wxClosure_Create(_fun_CEvent, _data)
}

// bool wxc_Initialize(int argc, wchar_t **argv);
@_silgen_name("wxc_Initialize")
fileprivate func wxc_Initialize(_ _argc: Int32, _ _argv: WCharPtrPtr) -> Int32
public func _wxc_Initialize(_ _argc: Int32, _ _argv: WCharPtrPtr) -> Int32 {
  return wxc_Initialize(_argc, _argv)
}

// void ELJApp_SetExitOnFrameDelete(bool flag);
@_silgen_name("ELJApp_SetExitOnFrameDelete")
fileprivate func ELJApp_SetExitOnFrameDelete(_ _flag: Int32) -> Void
public func _wxc_ELJApp_SetExitOnFrameDelete(_ _flag: Int32) -> Void {
  return ELJApp_SetExitOnFrameDelete(_flag)
}
 
// int ELJApp_MainLoop();
@_silgen_name("ELJApp_MainLoop")
fileprivate func ELJApp_MainLoop() -> Int32
public func _wxc_ELJApp_MainLoop() -> Int32 {
  return ELJApp_MainLoop()
}

// void  ELJApp_InitializeC( TClass(wxClosure) closure, int _argc, TChar** _argv );
@_silgen_name("ELJApp_InitializeC")
fileprivate func ELJApp_InitializeC(_ closure: VoidPtr, _ _argc: Int32, _ _argv: WCharPtrPtr)
public func _wxc_ELJApp_InitializeC(_ closure: VoidPtr, _ _argc: Int32, _ _argv: WCharPtrPtr) {
  ELJApp_InitializeC(closure, _argc, _argv)
}

// TClass(wxPanel)  wxPanel_Create( TClass(wxWindow) _prt, int _id, TRect(_lft,_top,_wdt,_hgt), int _stl );
@_silgen_name("wxPanel_Create")
fileprivate func wxPanel_Create(_ _prt: VoidPtr, _ _id: Int32, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_Panel_Create(_ _prt: VoidPtr, _ _id: Int32, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxPanel_Create(_prt, _id, _lft, _top, _wdt, _hgt, _stl)
}

// TClass(wxStaticBox) wxStaticBox_Create( TClass(wxWindow) _prt, int _id, TClass(wxString) _txt, TRect(_lft,_top,_wdt,_hgt), int _stl );
@_silgen_name("wxStaticBox_Create")
fileprivate func wxStaticBox_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_StaticBox_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxStaticBox_Create(_prt, _id, _txt, _lft, _top, _wdt, _hgt, _stl)
}

// TClass(wxButton) wxButton_Create( TClass(wxWindow) _prt, int _id, TClass(wxString) _txt, TRect(_lft,_top,_wdt,_hgt), int _stl );
@_silgen_name("wxButton_Create")
fileprivate func wxButton_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_Button_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxButton_Create(_prt, _id, _txt, _lft, _top, _wdt, _hgt, _stl)
}

// TClass(wxTextCtrl) wxTextCtrl_Create( TClass(wxWindow) _prt, int _id, TClass(wxString) _txt, TRect(_lft,_top,_wdt,_hgt), long _stl );
@_silgen_name("wxTextCtrl_Create")
fileprivate func wxTextCtrl_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_TextCtrl_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxTextCtrl_Create(_prt, _id, _txt, _lft, _top, _wdt, _hgt, _stl)
}

// TClass(wxStaticText) wxStaticText_Create( TClass(wxWindow) _prt, int _id, TClass(wxString) _txt, TRect(_lft,_top,_wdt,_hgt), int _stl );
@_silgen_name("wxStaticText_Create")
fileprivate func wxStaticText_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_StaticText_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxStaticText_Create(_prt, _id, _txt, _lft, _top, _wdt, _hgt, _stl)
}

// TClass(wxIcon) wxIcon_CreateLoad( TClass(wxString) name, long type, TSize(width,height) );
@_silgen_name("wxIcon_CreateLoad")
fileprivate func wxIcon_CreateLoad(_ name: VoidPtr, _ type: Int32, _ _wdt: Int32, _ _hgt: Int32) -> VoidPtr
public func _wxc_Icon_CreateLoad(_ name: VoidPtr, _ type: Int32, _ _wdt: Int32, _ _hgt: Int32) -> VoidPtr {
  return wxIcon_CreateLoad(name, type, _wdt, _hgt)
}

// TClass(wxFont) wxFont_Create( int pointSize, int family, int style, int weight, TBool underlined, TClass(wxString) face, int enc );
@_silgen_name("wxFont_Create")
fileprivate func wxFont_Create(_ pointSize: Int32, _ family: Int32, _ style: Int32, _ weight: Int32, _ underlined: Int32, _ face: VoidPtr, _ enc: Int32) -> VoidPtr
public func _wxc_Font_Create(_ pointSize: Int32, _ family: Int32, _ style: Int32, _ weight: Int32, _ underlined: Int32, _ face: VoidPtr, _ enc: Int32) -> VoidPtr {
  return wxFont_Create(pointSize, family, style, weight, underlined, face, enc)
}

// void       wxTopLevelWindow_SetIcon( TSelf(wxTopLevelWindow) _obj, TClass(wxIcon) pIcon );
@_silgen_name("wxTopLevelWindow_SetIcon")
fileprivate func wxTopLevelWindow_SetIcon(_ _obj: VoidPtr, _ pIcon: VoidPtr) -> Void
public func _wxc_TopLevelWindow_SetIcon(_ _obj: VoidPtr, _ pIcon: VoidPtr) -> Void {
  wxTopLevelWindow_SetIcon(_obj, pIcon)
}

// int        wxWindow_SetFont( TSelf(wxWindow) _obj, TClass(wxFont) font );
@_silgen_name("wxWindow_SetFont")
fileprivate func wxWindow_SetFont(_ _obj: VoidPtr, _ font: VoidPtr) -> Int32
public func _wxc_Window_SetFont(_ _obj: VoidPtr, _ font: VoidPtr) -> Int32 {
  return wxWindow_SetFont(_obj, font)
}

// int        wxWindow_SetBackgroundColour( TSelf(wxWindow) _obj, TClass(wxColour) colour );
@_silgen_name("wxWindow_SetBackgroundColour")
fileprivate func wxWindow_SetBackgroundColour(_ _obj: VoidPtr, _ colour: VoidPtr) -> Int32
public func _wxc_Window_SetBackgroundColour(_ _obj: VoidPtr, _ colour: VoidPtr) -> Int32 {
  return wxWindow_SetBackgroundColour(_obj, colour)
}

// int        wxButton_SetBackgroundColour( TSelf(wxButton) _obj, TClass(wxColour) colour );
@_silgen_name("wxButton_SetBackgroundColour")
fileprivate func wxButton_SetBackgroundColour(_ _obj: VoidPtr, _ colour: VoidPtr) -> Int32
public func _wxc_Button_SetBackgroundColour(_ _obj: VoidPtr, _ colour: VoidPtr) -> Int32 {
  return wxButton_SetBackgroundColour(_obj, colour)
}

// TClass(wxColour) wxColour_CreateRGB( TUInt8 _red, TUInt8 _green, TUInt8 _blue, TUInt8 _alpha );
@_silgen_name("wxColour_CreateRGB")
fileprivate func wxColour_CreateRGB(_ _red: UInt8, _ _green: UInt8, _ _blue: UInt8, _ _alpha: UInt8) -> VoidPtr
public func _wxc_Colour_CreateRGB(_ _red: UInt8, _ _green: UInt8, _ _blue: UInt8, _ _alpha: UInt8) -> VoidPtr {
  return wxColour_CreateRGB(_red, _green, _blue, _alpha)
}

// int        wxWindow_SetForegroundColour( TSelf(wxWindow) _obj, TClass(wxColour) colour );
@_silgen_name("wxWindow_SetForegroundColour")
fileprivate func wxWindow_SetForegroundColour(_ _obj: VoidPtr, _ colour: VoidPtr) -> Int32
public func _wxc_Window_SetForegroundColour(_ _obj: VoidPtr, _ colour: VoidPtr) -> Int32 {
  return wxWindow_SetForegroundColour(_obj, colour)
}

// TClass(wxFileDialog) wxFileDialog_Create( TClass(wxWindow) _prt, TClass(wxString) _msg, TClass(wxString) _dir, TClass(wxString) _fle, TClass(wxString) _wcd, TPoint(_lft,_top), int _stl );
@_silgen_name("wxFileDialog_Create")
fileprivate func wxFileDialog_Create(_ _prt: VoidPtr, _ _msg: VoidPtr, _ _dir: VoidPtr, _ _fle: VoidPtr, _ _wcd: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _stl: Int32) -> VoidPtr
public func _wxc_FileDialog_Create(_ _prt: VoidPtr, _ _msg: VoidPtr, _ _dir: VoidPtr, _ _fle: VoidPtr, _ _wcd: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _stl: Int32) -> VoidPtr {
  return wxFileDialog_Create(_prt, _msg, _dir, _fle, _wcd, _lft, _top, _stl)
}

// int        wxDialog_ShowModal( TSelf(wxDialog) _obj );
@_silgen_name("wxDialog_ShowModal")
fileprivate func wxDialog_ShowModal(_ _obj: VoidPtr) -> Int32
public func _wxc_Dialog_ShowModal(_ _obj: VoidPtr) -> Int32 {
  return wxDialog_ShowModal(_obj)
}

// int        wxMessageDialog_ShowModal( TSelf(wxMessageDialog) _obj );
@_silgen_name("wxMessageDialog_ShowModal")
fileprivate func wxMessageDialog_ShowModal(_ _obj: VoidPtr) -> Int32
public func _wxc_MessageDialog_ShowModal(_ _obj: VoidPtr) -> Int32 {
  return wxMessageDialog_ShowModal(_obj)
}

// TClass(wxString) wxFileDialog_GetPath( TSelf(wxFileDialog) _obj );
@_silgen_name("wxFileDialog_GetPath")
fileprivate func wxFileDialog_GetPath(_ _obj: VoidPtr) -> VoidPtr
public func _wxc_FileDialog_GetPath(_ _obj: VoidPtr) -> VoidPtr {
  return wxFileDialog_GetPath(_obj)
}

// void       wxTextCtrl_AppendText( TSelf(wxTextCtrl) _obj, TClass(wxString) text );
@_silgen_name("wxTextCtrl_AppendText")
fileprivate func wxTextCtrl_AppendText(_ _obj: VoidPtr, _ text: VoidPtr)
public func _wxc_TextCtrl_AppendText(_ _obj: VoidPtr, _ text: VoidPtr) {
  return wxTextCtrl_AppendText(_obj, text)
}

// void       wxTextCtrl_Clear( TSelf(wxTextCtrl) _obj );
@_silgen_name("wxTextCtrl_Clear")
fileprivate func wxTextCtrl_Clear(_ _obj: VoidPtr) -> Void
public func _wxc_TextCtrl_Clear(_ _obj: VoidPtr) -> Void {
  return wxTextCtrl_Clear(_obj)
}

// TClass(wxMessageDialog) wxMessageDialog_Create( TClass(wxWindow) _prt, TClass(wxString) _msg, TClass(wxString) _cap, int _stl );
@_silgen_name("wxMessageDialog_Create")
fileprivate func wxMessageDialog_Create(_ _prt: VoidPtr, _ _msg: VoidPtr, _ _cap: VoidPtr, _ _stl: Int32) -> VoidPtr
public func _wxc_MessageDialog_Create(_ _prt: VoidPtr, _ _msg: VoidPtr, _ _cap: VoidPtr, _ _stl: Int32) -> VoidPtr {
  return wxMessageDialog_Create(_prt, _msg, _cap, _stl)
}

// void       wxWindow_SetWindowStyleFlag( TSelf(wxWindow) _obj, long style );
@_silgen_name("wxWindow_SetWindowStyleFlag")
fileprivate func wxWindow_SetWindowStyleFlag(_ _prt: VoidPtr, _ style: Int32) -> Void
public func _wxc_Window_SetWindowStyleFlag(_ _prt: VoidPtr, _ style: Int32) -> Void {
  return wxWindow_SetWindowStyleFlag(_prt, style)
}

// int        wxEvtHandler_Connect( TSelf(wxEvtHandler) _obj, int first, int last, int type, void* data );
@_silgen_name("wxEvtHandler_Connect")
fileprivate func wxEvtHandler_Connect(_ _obj: VoidPtr, _ first: Int32, _ last: Int32, _ type: Int32, _ data: VoidPtr) -> Int32
public func _wxc_EvtHandler_Connect(_ _obj: VoidPtr, _ first: Int32, _ last: Int32, _ type: Int32, _ data: VoidPtr) -> Int32 {
  return wxEvtHandler_Connect(_obj, first, last, type, data)
}

// int        wxEvent_GetEventType( TSelf(wxEvent) _obj );
@_silgen_name("wxEvent_GetEventType")
fileprivate func wxEvent_GetEventType(_ _obj: VoidPtr) -> Int32
public func _wxc_wxEvent_GetEventType(_ _obj: VoidPtr) -> Int32 {
  return wxEvent_GetEventType(_obj)
}

// TClass(wxCharBuffer) wxString_GetUtf8( TSelf(wxString) s);
@_silgen_name("wxString_GetUtf8")
fileprivate func wxString_GetUtf8(_ s: VoidPtr) -> VoidPtr
public func _wxc_wxString_GetUtf8(_ s: VoidPtr) -> VoidPtr {
  return wxString_GetUtf8(s)
}

// char* wxCharBuffer_DataUtf8( TSelf(wxCharBuffer) cb);
@_silgen_name("wxCharBuffer_DataUtf8")
fileprivate func wxCharBuffer_DataUtf8(_ cb: VoidPtr) -> CharPtr
public func _wxc_wxCharBuffer_DataUtf8(_ cb: VoidPtr) -> CharPtr {
  return wxCharBuffer_DataUtf8(cb)
}

// void wxCharBuffer_Delete( TSelf(wxCharBuffer) cb);
@_silgen_name("wxCharBuffer_Delete")
fileprivate func wxCharBuffer_Delete(_ cb: VoidPtr) -> Void
public func _wxc_wxCharBuffer_Delete(_ cb: VoidPtr) -> Void {
  return wxCharBuffer_Delete(cb)
}

// TBool wxc_LaunchDefaultBrowser(TClass(wxString) url, int flags);
@_silgen_name("wxc_LaunchDefaultBrowser")
fileprivate func wxc_LaunchDefaultBrowser(_ url: VoidPtr, _ flags: Int32) -> Int32
public func _wxc_LaunchDefaultBrowser(_ url: VoidPtr, _ flags: Int32) -> Int32 {
  return wxc_LaunchDefaultBrowser(url, flags)
}

// int ELJApp_ExecuteProcess( TClass(wxString) _cmd, int _snc, TClass(wxProcess) _prc );
@_silgen_name("ELJApp_ExecuteProcess")
fileprivate func ELJApp_ExecuteProcess(_ _cmd: VoidPtr, _ _snc: Int32, _ _prc: VoidPtr) -> Int32
public func _wxc_ELJApp_ExecuteProcess(_ _cmd: VoidPtr, _ _snc: Int32, _ _prc: VoidPtr) -> Int32 {
  return ELJApp_ExecuteProcess(_cmd, _snc, _prc)
}

// TClass(wxString) wxc_ExecuteOutErr(TClass(wxString) _cmd);
@_silgen_name("wxc_ExecuteOutErr")
fileprivate func wxc_ExecuteOutErr(_ _cmd: VoidPtr) -> VoidPtr
public func _wxc_ExecuteOutErr(_ _cmd: VoidPtr) -> VoidPtr {
  return wxc_ExecuteOutErr(_cmd)
}

// TBool      wxc_FileExists(TClass(wxString) filename);
@_silgen_name("wxc_FileExists")
fileprivate func wxc_FileExists(_ filename: VoidPtr) -> Int32
public func _wxc_FileExists(_ filename: VoidPtr) -> Int32 {
  return wxc_FileExists(filename)
}

// int wxIcon_GetHeight( TSelf(wxIcon) _obj );
@_silgen_name("wxIcon_GetHeight")
fileprivate func wxIcon_GetHeight(_ _obj: VoidPtr) -> Int32
public func _wxc_Icon_GetHeight(_ _obj: VoidPtr) -> Int32 {
  return wxIcon_GetHeight(_obj)
}

// int wxIcon_GetWidth( TSelf(wxIcon) _obj );
@_silgen_name("wxIcon_GetWidth")
fileprivate func wxIcon_GetWidth(_ _obj: VoidPtr) -> Int32
public func _wxc_Icon_GetWidth(_ _obj: VoidPtr) -> Int32 {
  return wxIcon_GetWidth(_obj)
}

// TBool wxIcon_IsOk( TSelf(wxIcon) _obj );
@_silgen_name("wxIcon_IsOk")
fileprivate func wxIcon_IsOk(_ _obj: VoidPtr) -> Int32
public func _wxc_Icon_IsOk(_ _obj: VoidPtr) -> Int32 {
  return wxIcon_IsOk(_obj)
}

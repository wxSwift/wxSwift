
public typealias VoidPtr = UnsafeMutableRawPointer!
public typealias WCharPtrPtr = UnsafeMutablePointer<UnsafeMutablePointer<UInt16>?>!
public typealias ConstCharPtr = UnsafePointer<Int8>!

public var _ID_ANY : Int32 = -1
public var _wxDEFAULT_FRAME_STYLE : Int32 = 541072960

// typedef void (*ClosureFun)( void* _fun, void* _data, void* _evt );
public typealias ClosureFun = (VoidPtr, VoidPtr, VoidPtr) -> Void

// int expEVT_COMMAND_MENU_SELECTED();
@_silgen_name("expEVT_COMMAND_MENU_SELECTED")
fileprivate func expEVT_COMMAND_MENU_SELECTED() -> CInt
public func EVT_COMMAND_MENU_SELECTED() -> CInt {
  return expEVT_COMMAND_MENU_SELECTED()
}

// TClass(wxFrame) wxFrame_Create( TClass(wxWindow) _prt, int _id, TClass(wxString) _txt, TRect(_lft,_top,_wdt,_hgt), int _stl );
@_silgen_name("wxFrame_Create")
fileprivate func wxFrame_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr
public func _wxFrame_Create(_ _prt: VoidPtr, _ _id: Int32, _ _txt: VoidPtr, _ _lft: Int32, _ _top: Int32, _ _wdt: Int32, _ _hgt: Int32, _ _stl: Int32) -> VoidPtr {
  return wxFrame_Create(_prt, _id, _txt, _lft, _top, _wdt, _hgt, _stl)
}

// TBool      wxWindow_Show( TSelf(wxWindow) _obj );
@_silgen_name("wxWindow_Show")
fileprivate func wxWindow_Show(_ _obj: VoidPtr) -> Int32
public func _wxWindow_Show(_ _obj: VoidPtr) -> Int32 {
  return wxWindow_Show(_obj)
}

// TClass(wxString) wxString_CreateUTF8(const char* buffer);
@_silgen_name("wxString_CreateUTF8")
fileprivate func wxString_CreateUTF8(_ buffer: ConstCharPtr) -> VoidPtr
public func _wxString_CreateUTF8(_ buffer: ConstCharPtr) -> VoidPtr {
  return wxString_CreateUTF8(buffer)
}

// TClass(wxClosure)  wxClosure_Create( TClosureFun _fun_CEvent, void* _data );
@_silgen_name("wxClosure_Create")
fileprivate func wxClosure_Create(_ _fun_CEvent: ClosureFun, _ _data: VoidPtr) -> VoidPtr
public func _wxClosure_Create(_ _fun_CEvent: ClosureFun, _ _data: VoidPtr) -> VoidPtr {
  return wxClosure_Create(_fun_CEvent, _data)
}

// bool wx_Initialize(int argc, wchar_t **argv);
@_silgen_name("wx_Initialize")
fileprivate func wx_Initialize(_ _argc: Int32, _ _argv: WCharPtrPtr) -> Int32
public func _wxInitialize(_ _argc: Int32, _ _argv: WCharPtrPtr) -> Int32 {
  return wx_Initialize(_argc, _argv)
}

// void ELJApp_SetExitOnFrameDelete(bool flag);
@_silgen_name("ELJApp_SetExitOnFrameDelete")
fileprivate func ELJApp_SetExitOnFrameDelete(_ _flag: Int32) -> Void
public func _ELJApp_SetExitOnFrameDelete(_ _flag: Int32) -> Void {
  return ELJApp_SetExitOnFrameDelete(_flag)
}
 
// int ELJApp_MainLoop();
@_silgen_name("ELJApp_MainLoop")
fileprivate func ELJApp_MainLoop() -> Int32
public func _ELJApp_MainLoop() -> Int32 {
  return ELJApp_MainLoop()
}

// void  ELJApp_InitializeC( TClass(wxClosure) closure, int _argc, TChar** _argv );
@_silgen_name("ELJApp_InitializeC")
fileprivate func ELJApp_InitializeC(_ closure: VoidPtr, _ _argc: Int32, _ _argv: WCharPtrPtr)
public func _ELJApp_InitializeC(_ closure: VoidPtr, _ _argc: Int32, _ _argv: WCharPtrPtr) {
  ELJApp_InitializeC(closure, _argc, _argv)
}


public typealias BindCallback = (Event) -> Void

open class Object {
  var _obj : VoidPtr
  
  public init() {}
}

func bridge<T : AnyObject>(obj : T) -> VoidPtr {
    return VoidPtr(Unmanaged.passUnretained(obj).toOpaque())
}

func bridge<T : AnyObject>(ptr : VoidPtr) -> T {
    return Unmanaged<T>.fromOpaque(ptr).takeUnretainedValue()
}

func bridgeRetained<T : AnyObject>(obj : T) -> VoidPtr {
    return VoidPtr(Unmanaged.passRetained(obj).toOpaque())
}

func bridgeTransfer<T : AnyObject>(ptr : VoidPtr) -> T {
    return Unmanaged<T>.fromOpaque(ptr).takeRetainedValue()
}

class ClosureData : AnyObject {
  var _event_obj : Object
  var _handler : BindCallback
  init(_ event_obj:Object, _ handler: @escaping BindCallback) {
    _event_obj = event_obj
    _handler = handler
  }
}

open class EvtHandler : Object {

  public override init() {
    super.init()
  }
  
  public func Bind(_ type: Int32, _ handler: @escaping BindCallback, _ wnd: Window) {
    let closure_fun : ClosureFun = {
      (a : VoidPtr, b : VoidPtr, evt : VoidPtr) -> Void in

      let data : ClosureData = bridge(ptr:b)
      if (evt == nil) {
        return
      }
      
      let event = Event()
      event.EventObject = data._event_obj
      event.EventType = _wxc_wxEvent_GetEventType(evt)
      
      data._handler(event)
    }
  
    let data = ClosureData(wnd, handler)
    _ = _wxc_EvtHandler_Connect(_obj, -1, -1, type, _wxc_Closure_Create(closure_fun, bridgeRetained(obj:data)))
  }

  public func Bind(_ type: Int32, _ handler: @escaping BindCallback) {
    Bind(type, handler, self as! Window)
  }
}

public class App : EvtHandler {
  public override init() {
    _ = _wxc_Initialize(0, nil);
    _wxc_ELJApp_SetExitOnFrameDelete(1);
  }

  public func MainLoop() {
    _ = _wxc_ELJApp_MainLoop()
  }
  
}

open class Window : EvtHandler {

  public override init() {
    super.init()
  }
  
  public func Show() {
    _ = _wxc_Window_Show(_obj)
  }
  
  public func SetFont(_ font: Font) {
    _ = _wxc_Window_SetFont(_obj, font._font)
  }
  
  public func SetForegroundColour(_ colour: Colour) {
    _ = _wxc_Window_SetForegroundColour(_obj, colour._colour)
  }

  public func SetBackgroundColour(_ colour: Colour) {
    _ = _wxc_Window_SetBackgroundColour(_obj, colour._colour)
  }

  public func SetWindowStyle(_ style: Int32) {
    SetWindowStyleFlag(style)
  }

  public func SetWindowStyleFlag(_ style: Int32) {
    _wxc_Window_SetWindowStyleFlag(_obj, style)
  }
}

public class TopLevelWindow : Window {
  public override init() {
    super.init()
  }

  public func SetIcon(_ icon: Icon) {
    _wxc_TopLevelWindow_SetIcon(_obj, icon._icon)
  }
}

public class Frame : TopLevelWindow {
  public init(_ parent: Int?, _ id: Int32, _ title: String, size: Size, style: Int32) {
    super.init()
    _obj = _wxc_Frame_Create(nil, id, _wxc_String_CreateUTF8(title), -1, -1, size.width, size.height, DEFAULT_FRAME_STYLE)
  }
}

public class Panel : Window {
  public init(_ parent: Window?) {
    super.init()
    _obj = _wxc_Panel_Create(parent?._obj, -1, -1, -1, -1, -1, TAB_TRAVERSAL)
  }
}

public class TextCtrl : Window {
  public init(_ parent: Window?, _ id: Int32, _ label: String, pos: Point, size: Size, style: Int32) {
    super.init()
    _obj = _wxc_TextCtrl_Create(parent?._obj, id, _wxc_String_CreateUTF8(label), pos.x, pos.y, size.width, size.height, style)
  }

  public func Clear() {
    _wxc_TextCtrl_Clear(_obj)
  }
  public func AppendText(_ text: String) {
    _wxc_TextCtrl_AppendText(_obj, _wxc_String_CreateUTF8(text))
  }
}

open class Button : Window {
  public init(_ parent: Window?, id: Int32, label: String, pos: Point, size: Size, style: Int32, validator: Int32, name: String) {
    super.init()
    _obj = _wxc_Button_Create(parent?._obj, id, _wxc_String_CreateUTF8(label), pos.x, pos.y, size.width, size.height, style)
  }

  public override func SetBackgroundColour(_ colour: Colour) {
    _ = _wxc_Button_SetBackgroundColour(_obj, colour._colour)
  }
}

public class StaticText : Window {
  public init(_ parent: Window?, _ id: Int32, _ label: String, pos: Point, size: Size) {
    super.init()
    _obj = _wxc_StaticText_Create(parent?._obj, id, _wxc_String_CreateUTF8(label), pos.x, pos.y, size.width, size.height, 0)
  }

}

public class StaticBox : Window {
  public init(_ parent: Window?, _ id: Int32, _ title: String, pos: Point, size: Size, style: Int32) {
    super.init()
    _obj = _wxc_StaticBox_Create(parent?._obj, id, _wxc_String_CreateUTF8(title), pos.x, pos.y, size.width, size.height, style)
  }
  public init(_ parent: Window?, _ id: Int32, _ title: String, pos: Point, size: Size) {
    super.init()
    _obj = _wxc_StaticBox_Create(parent?._obj, id, _wxc_String_CreateUTF8(title), pos.x, pos.y, size.width, size.height, 0)
  }
}

public class Dialog : Window {
  public func ShowModal() -> Int32 {
    return _wxc_Dialog_ShowModal(_obj)
  }
}

public class MessageDialog : Dialog {
  public init(_ parent: Window, _ message: String, _ caption: String, style: Int32) {
    super.init()
    _obj = _wxc_MessageDialog_Create(parent._obj, _wxc_String_CreateUTF8(message), _wxc_String_CreateUTF8(caption), style)
  }

  public override func ShowModal() -> Int32 {
    return _wxc_MessageDialog_ShowModal(_obj)
  }
}

public class FileDialog : Dialog {
  public init(_ parent: Window, _ message: String, _ defaultDir: String, _ defaultFile: String, _ wildcard: String, _ style: Int32) {
    super.init()
    _obj = _wxc_FileDialog_Create(parent._obj, _wxc_String_CreateUTF8(message), _wxc_String_CreateUTF8(defaultDir), _wxc_String_CreateUTF8(defaultFile), _wxc_String_CreateUTF8(wildcard), -1, -1, style)
  }

  public func GetPath() -> String {
    let wx_string = _wxc_FileDialog_GetPath(_obj)
    let utf8_char_buf = _wxc_wxString_GetUtf8(wx_string)
    let ret = String(cString: _wxc_wxCharBuffer_DataUtf8(utf8_char_buf))
    _wxc_wxCharBuffer_Delete(utf8_char_buf)
    return ret
  }
}

public class Colour : Object {
  var _colour : VoidPtr
  public init(_ colour: UInt32) {
    super.init()
    _colour = _wxc_Colour_CreateRGB(UInt8(colour % 256), UInt8((colour / 256)%256), UInt8((colour/65536)%256), UInt8(colour/65536/256))
  }
  
  public init(_ ptr: VoidPtr) {
    super.init()
    _colour = ptr;
  }
}

public class Font : Object {
  var _font : VoidPtr
  public init(_ pointSize: Int32, _ family: Int32, _ style: Int32, _ weight: Int32) {
    super.init()
    _font = _wxc_Font_Create(pointSize, family, style, weight, 0, _wxc_String_CreateUTF8(""), FONTENCODING_DEFAULT)
  }
}

public class Icon : Object {
  var _icon : VoidPtr
  public init(_ name: String, _ type: Int32, _ size: Size) {
    super.init()
    _icon = _wxc_Icon_CreateLoad(_wxc_String_CreateUTF8(name), type, size.width, size.height)
  }

  public init(_ name: String) {
    super.init()
    // FIXME: Use BITMAP_TYPE_ANY. Find out why it doesn't work.
    _icon = _wxc_Icon_CreateLoad(_wxc_String_CreateUTF8(name), BITMAP_TYPE_ICO, -1, -1)
  }
  
  public func GetHeight() -> Int {
    return Int(_wxc_Icon_GetHeight(_icon))
  }
  
  public func GetWidth() -> Int {
    return Int(_wxc_Icon_GetWidth(_icon))
  }
  
  public func IsOk() -> Bool {
    return _wxc_Icon_IsOk(_icon) != 0
  }
}

public class Event : Object {
  var _evtobj : Object = Object()
  var _evttype : Int32 = 0
//  var _id : Int32
  
  public var EventObject : Object {
    get {
      return _evtobj
    }
    set(evtobj) {
      _evtobj = evtobj
    }
  }
  
  public var EventType : Int32 {
    get {
      return _evttype
    }
    set(evttype) {
      _evttype = evttype
    }
  }
}

public func LaunchDefaultBrowser(_ url: String) -> Bool {
  let ret = _wxc_LaunchDefaultBrowser(_wxc_String_CreateUTF8(url), 0)
  return ret == 1
}

public func Execute(_ command: String, _ flags: Int32, _ callback: VoidPtr) -> Int {
  return Int(_wxc_ELJApp_ExecuteProcess(_wxc_String_CreateUTF8(command), flags, callback))
}

public func ExecuteOutErr(_ command: String) -> String {
  let wx_string = _wxc_ExecuteOutErr(_wxc_String_CreateUTF8(command));
  let utf8_char_buf = _wxc_wxString_GetUtf8(wx_string)
  let ret = String(cString: _wxc_wxCharBuffer_DataUtf8(utf8_char_buf))
  _wxc_wxCharBuffer_Delete(utf8_char_buf)
  return ret
}

public func FileExists(_ filename: String) -> Bool {
  let ret = _wxc_FileExists(_wxc_String_CreateUTF8(filename))
  return ret == 1
}

public struct Point {
  var x : Int32
  var y : Int32
  public init(_ x: Int32, _ y: Int32) {
    self.x = x
    self.y = y
  }
}

public struct Size {
  var width : Int32
  var height : Int32
  public init(_ width: Int32, _ height: Int32) {
    self.width = width
    self.height = height
  }
}
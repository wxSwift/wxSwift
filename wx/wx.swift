import wxcore

public var ID_ANY : Int = -1
public var wxDEFAULT_FRAME_STYLE : Int32 = 541072960;

public class App {
  public init() {
    _ = wx_Initialize(0, nil);
    ELJApp_SetExitOnFrameDelete(1);
  }

  public func MainLoop() {
    _ = ELJApp_MainLoop()
  }
}

public class Frame {
  var _frame : VoidPtr
  
  public init(_ parent: Int?, _ id: Int, _ title: String) {
    _frame = wxFrame_Create(nil, -1, wxString_CreateUTF8(title), 50, 50, 450, 340, wxDEFAULT_FRAME_STYLE)
  }

  public func Show() {
    _ = wxWindow_Show(_frame)
  }
}

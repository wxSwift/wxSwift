
public class App {
  public init() {
    _ = _wxInitialize(0, nil);
    _ELJApp_SetExitOnFrameDelete(1);
  }

  public func MainLoop() {
    _ = _ELJApp_MainLoop()
  }
}

public class Frame {
  var _frame : VoidPtr
  
  public init(_ parent: Int?, _ id: Int, _ title: String) {
    _frame = _wxFrame_Create(nil, -1, _wxString_CreateUTF8(title), 50, 50, 450, 340, _wxDEFAULT_FRAME_STYLE)
  }

  public func Show() {
    _ = _wxWindow_Show(_frame)
  }
}

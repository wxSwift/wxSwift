import wx

_ = _wxInitialize(0, nil);
_ELJApp_SetExitOnFrameDelete(1);

let frame = _wxFrame_Create(nil, _ID_ANY, _wxString_CreateUTF8("Hello World"), 50, 50, 450, 340, _wxDEFAULT_FRAME_STYLE)
_ = _wxWindow_Show(frame)

_ = _ELJApp_MainLoop()


import wx

_ = _wxc_Initialize(0, nil);
_wxc_ELJApp_SetExitOnFrameDelete(1);

let frame = _wxc_Frame_Create(nil, ID_ANY, _wxc_String_CreateUTF8("Hello World"), 50, 50, 450, 340, DEFAULT_FRAME_STYLE)
_ = _wxc_Window_Show(frame)

_ = _wxc_ELJApp_MainLoop()


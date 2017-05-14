import wxcore

_ = wx_Initialize(0, nil);
ELJApp_SetExitOnFrameDelete(1);

let frame = wxFrame_Create(nil, -1, wxString_CreateUTF8("Hello World"), 50, 50, 450, 340, wxDEFAULT_FRAME_STYLE)
_ = wxWindow_Show(frame)

_ = ELJApp_MainLoop()


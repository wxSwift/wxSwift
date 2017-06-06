/*
import wx

let app = wx.App(false)
let frame = wx.Frame(nil, wx.ID_ANY, "Hello World")
frame.show(true)
app.mainLoop()
*/
/*
import wxC

let frame = wxFrame_Create(nil, ID_ANY, "Hello World")
wxWindow_Show(frame)
mainLoop()
*/

/*
Compile
  cd c:/Work/wxSwift/vcproj/x64/Release
  set PATH=c:/Program Files/LLVM/bin;%PATH%;C:\packages\wxWidgets-3.1.0\vc140_x64_dll;c:/Program Files/Swift/bin;c:/Program Files/Swift/lib/swift/windows
  swiftc -I C:/packages/wxWidgets-3.1.0/include -I C:/packages/wxWidgets-3.1.0/msvc -lwxC -O ../../../samples/wxc/wxCTest.swift

Run
  wxCTest 
*/

import wxC

// void MyApp_OnInit(void* _fun, void* _data, void* _evt)

typealias OnInitProc = @convention(c) (UnsafeMutablePointer<Void>?, UnsafeMutablePointer<Void>?, UnsafeMutablePointer<Void>?) -> Void

var MyApp_OnInit : OnInitProc = {
	(_, _, _) -> Void in
  let frame = wxFrame_Create(nil, -1, wxString_CreateUTF8("Hello World"), 50, 50, 450, 340, wxDEFAULT_FRAME_STYLE)
  wxWindow_Show(frame)
}

ELJApp_InitializeC(wxClosure_Create(MyApp_OnInit, nil), 0, nil)


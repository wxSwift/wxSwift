
// MinGW
// clang++ -std=c++14 wxCHello.cpp -I C:/Work/wxSwift/wxc/src/include -L ../../wxc/build/cpp -lwxC -L c:/Work/wxWidgets-3.0.3/lib/gcc510TDM_x64_dll -lwxbase30u -lwxbase30u_net -lwxbase30u_xml -lwxexpat -lwxjpeg -lwxmsw30u_adv -lwxmsw30u_aui -lwxmsw30u_core -lwxmsw30u_gl -lwxmsw30u_html -lwxmsw30u_media -lwxmsw30u_propgrid -lwxmsw30u_ribbon -lwxmsw30u_richtext -lwxmsw30u_stc -lwxmsw30u_webview -lwxmsw30u_xrc -lwxpng -lwxregexu -lwxscintilla -lwxtiff -lwxzlib -o wxCHello.exe
// clang++ -std=c++14 wxCHello.cpp -I C:/Work/wxSwift/wxc/src/include -L ../../wxc/build/cpp -lwxC -L C:/Work/wxWidgets-3.0.3/lib/gcc630_x64_dll    -lwxbase30u -lwxbase30u_net -lwxbase30u_xml -lwxexpat -lwxjpeg -lwxmsw30u_adv -lwxmsw30u_aui -lwxmsw30u_core -lwxmsw30u_gl -lwxmsw30u_html -lwxmsw30u_media -lwxmsw30u_propgrid -lwxmsw30u_ribbon -lwxmsw30u_richtext -lwxmsw30u_stc -lwxmsw30u_webview -lwxmsw30u_xrc -lwxpng -lwxregexu -lwxscintilla -lwxtiff -lwxzlib -o wxCHello.exe

// wxc.h needs stdint.h and time.h
#include <stdint.h>
#include <time.h>
extern "C" {
#include "wxc.h"
}

const int wxEVT_COMMAND_MENU_SELECTED = expEVT_COMMAND_MENU_SELECTED();
const int wxDEFAULT_FRAME_STYLE = 541072960;
const int wxID_ANY = -1;
const int wxID_EXIT = 5006;
const int wxID_ABOUT = 5014;

enum
{
	ID_Hello = 1
};

void *frame;

void MyFrame_OnExit(void *, void *, void *event) //  wxCommandEvent& WXUNUSED(event))
{
  if (!event)
    return;
	wxWindow_Close(frame, true);
}

void MyFrame_About(void *, void *, void *event)
{
  if (!event)
    return;
	void *msgdlg = wxMessageDialog_Create(frame, wxString_CreateUTF8("This is a wxWidgets' Hello world sample"),
										  wxString_CreateUTF8("About Hello World"),
										  0x00000004/*wxOK*/ | 0x00000800/*wxICON_INFORMATION*/);
	wxMessageDialog_ShowModal(msgdlg);
	wxMessageDialog_Delete(msgdlg);
}

void MyFrame_Hello(void *, void *, void *event)
{
  if (!event)
    return;
	void *msgdlg = wxMessageDialog_Create(frame, wxString_CreateUTF8("Hello world from wxWidgets!"), wxString_CreateUTF8(""),
										  0x00000004/*wxOK*/ | 0x00000800/*wxICON_INFORMATION*/);
	wxMessageDialog_ShowModal(msgdlg);
	wxMessageDialog_Delete(msgdlg);
}

void MyApp_OnInit(void* _fun, void* _data, void* _evt)
{
	void *title = wxString_CreateUTF8("Hello World");
	frame = wxFrame_Create(NULL, wxID_ANY, title, 50, 50, 450, 340, wxDEFAULT_FRAME_STYLE);

	// Menu
	void *empty_str = wxString_CreateUTF8("");
	void *menuFile = wxMenu_Create(empty_str, 0);
	wxMenu_Append(menuFile, ID_Hello, wxString_CreateUTF8("&Hello...\tCtrl-H"),
				  wxString_CreateUTF8("Help string shown in status bar for this menu item"), 0/*wxITEM_NORMAL*/);
	wxMenu_AppendSeparator(menuFile);
	wxMenu_Append(menuFile, wxID_EXIT, empty_str, empty_str, 0/*wxITEM_NORMAL*/);

	void *menuHelp = wxMenu_Create(empty_str, 0);
	wxMenu_Append(menuHelp, wxID_ABOUT, empty_str, empty_str, 0/*wxITEM_NORMAL*/);

	void *menu_bar = wxMenuBar_Create(0);
	wxMenuBar_Append(menu_bar, menuFile, wxString_CreateUTF8("&File"));
	wxMenuBar_Append(menu_bar, menuHelp, wxString_CreateUTF8("&Help"));
	wxFrame_SetMenuBar(frame, menu_bar);

	// Status Bar
	wxFrame_CreateStatusBar(frame, 1, 65840L);
	void *status_txt = wxString_CreateUTF8("Welcome to wxWidgets!");
	wxFrame_SetStatusText(frame, status_txt, 0);

	wxEvtHandler_Connect(frame, wxID_EXIT, wxID_EXIT, wxEVT_COMMAND_MENU_SELECTED, wxClosure_Create((void *)MyFrame_OnExit, 0));
	wxEvtHandler_Connect(frame, wxID_ABOUT, wxID_ABOUT, wxEVT_COMMAND_MENU_SELECTED, wxClosure_Create((void *)MyFrame_About, 0));
	wxEvtHandler_Connect(frame, ID_Hello, ID_Hello, wxEVT_COMMAND_MENU_SELECTED, wxClosure_Create((void *)MyFrame_Hello, 0));
  
	wxWindow_Show(frame);
}


#if __MINGW32__

int main(int, char **)
{
  wx_Initialize(0, (wchar_t**)NULL);
  ELJApp_SetExitOnFrameDelete(true);

  MyApp_OnInit(NULL, NULL, NULL);

  ELJApp_MainLoop();
	return 0;
}

#include <string.h>
extern "C" wchar_t *__imp__Z13wxCRT_StrdupWPKw(const wchar_t *pwz)
{
	return _wcsdup(pwz);
}

#else

#define WIN32_LEAN_AND_MEAN             // 거의 사용되지 않는 내용은 Windows 헤더에서 제외합니다.
// Windows 헤더 파일:
#include <windows.h>

int CALLBACK WinMain(
	HINSTANCE hInstance,
	HINSTANCE hPrevInstance,
	LPSTR     lpCmdLine,
	int       nCmdShow
)
{
	ELJApp_InitializeC(wxClosure_Create((void *)MyApp_OnInit, NULL), 0, NULL);
	return 0;
};

#endif

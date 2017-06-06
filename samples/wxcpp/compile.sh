#!/bin/sh

/mingw64/bin/clang++ -std=c++14 wxCppHello.cpp -I c:/Work/wxWidgets-3.0.3/lib/gcc510TDM_x64_dll/mswu -I c:/Work/wxWidgets-3.0.3/include -L c:/Work/wxWidgets-3.0.3/lib/gcc510TDM_x64_dll -lwxbase30u -lwxbase30u_net -lwxbase30u_xml -lwxexpat -lwxjpeg -lwxmsw30u_adv -lwxmsw30u_aui -lwxmsw30u_core -lwxmsw30u_gl -lwxmsw30u_html -lwxmsw30u_media -lwxmsw30u_propgrid -lwxmsw30u_ribbon -lwxmsw30u_richtext -lwxmsw30u_stc -lwxmsw30u_webview -lwxmsw30u_xrc -lwxpng -lwxregexu -lwxscintilla -lwxtiff -lwxzlib -o wxCppHello.exe -Wno-macro-redefined -D__GXX_ABI_VERSION=1008


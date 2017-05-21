#!/bin/sh

# Input
#
# wx.swift
# wxc_wrapper.swift
# wxwidgets_patch.cpp
# libwxC.a
# libraries of wxWidgets-3.0.3

# Output
#
# wx.swiftmodule
# wx.swiftdoc
# libwx.dll

export SWIFT_BIN=c:/Work/swift_msvc/build/NinjaMinGW/swift/bin
export WXWIDGETS_INCDIR=/c/work/wxWidgets-3.0.3/include
export WXWIDGETS_LIBDIR=/c/work/wxWidgets-3.0.3/lib/gcc510TDM_x64_dll
export WXC_INCDIR=/c/work/wxSwift/wxc/src/include
export WXC_LIBDIR=/c/work/wxSwift/wxc/build/cpp
export CCC=/mingw64/bin/clang++

echo "Generating wx.swiftmodule"
$SWIFT_BIN/swiftc -emit-module wx.swift wxc_wrapper.swift -module-name wx -module-link-name wx -O -parse-as-library

echo "Compiling wx.swift"
$SWIFT_BIN/swiftc -c -module-name wx -O -parse-as-library -force-single-frontend-invocation -o wx.o wx.swift wxc_wrapper.swift

echo "Compiling wxwidgets_patch.cpp"
$CCC -c wxwidgets_patch.cpp

echo "Building libwx.dll"
$CCC -shared -o libwx.dll wx.o wxwidgets_patch.o -L$SWIFT_BIN/../lib/swift/mingw -lswiftCore -L C:/Work/wxSwift/wxc/build/cpp -lwxC -Wl,--out-implib,libwx.dll.a  -L $WXWIDGETS_LIBDIR -lwxbase30u -lwxbase30u_net -lwxbase30u_xml -lwxexpat -lwxjpeg -lwxmsw30u_adv -lwxmsw30u_aui -lwxmsw30u_core -lwxmsw30u_gl -lwxmsw30u_html -lwxmsw30u_media -lwxmsw30u_propgrid -lwxmsw30u_ribbon -lwxmsw30u_richtext -lwxmsw30u_stc -lwxmsw30u_webview -lwxmsw30u_xrc -lwxpng -lwxregexu -lwxscintilla -lwxtiff -lwxzlib -Xlinker --allow-multiple-definition

echo "Installing"
mv wx.swiftmodule wx.swiftdoc $SWIFT_BIN/../lib/swift/mingw/x86_64
mv libwx.dll $SWIFT_BIN/../lib/swift/mingw
rm libwx.dll.a

echo 
echo "RUN swift test_wx1.swift"
echo " or swift test_wx2.swift"


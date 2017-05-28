import wx

///////////////////////
// Common Variables
///////////////////////

var swift_source : String = ""
var swift_out_exe : String = ""
var init_swift_compiler_exe : String = "C:\\SwiftForWindows\\Swift\\bin\\swiftc.exe"
var swift_compiler_exe : String = init_swift_compiler_exe
var swift_logo_ico : String = "Swift_logo.svg.png.ico"
var run_in_new_window = true


//////////////////////////////
// Define Text Style Button
//////////////////////////////

class TextButton : wx.Button {
  init(_ parent: Window?, id: Int32, label: String, pos: Point, size: Size) {
    super.init(parent, id:id, label:label, pos:pos, size:size, style:wx.BORDER_NONE, 
      validator:wx.DefaultValidator, name:"noname")

      SetFont(wx.Font(8, wx.DECORATIVE, wx.NORMAL, wx.NORMAL))
      SetBackgroundColour(wx.Colour(0xFFFFFF))
      SetForegroundColour(wx.Colour(0xFFFF9933))
      
      Bind(wx.EVT_ENTER_WINDOW, { _ in
        self.SetBackgroundColour(wx.NullColour)
        self.SetWindowStyle(wx.BORDER_DEFAULT)
      })
      
      Bind(wx.EVT_LEAVE_WINDOW, { _ in
        self.SetBackgroundColour(wx.Colour(0xFFFFFF))
        self.SetWindowStyle(wx.BORDER_NONE)
      })
  }
}

///////////////////////
// Initialization
///////////////////////

var app = wx.App()

var frame = wx.Frame(nil, wx.ID_ANY, "Swift for Windows 1.6", size: wx.Size(1000, 600), style: wx.DEFAULT_FRAME_STYLE & ~wx.RESIZE_BORDER )

if wx.FileExists(swift_logo_ico) {
  let icon = wx.Icon(swift_logo_ico)
  frame.SetIcon(icon)
}

var panel = wx.Panel(frame)
panel.SetBackgroundColour(wx.Colour(0xFFFFFF))

var font_log = wx.Font(9, wx.FONTFAMILY_MODERN, wx.NORMAL, wx.NORMAL)
var font_12 = wx.Font(10, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
var font_19B = wx.Font(15, wx.DECORATIVE, wx.NORMAL, wx.BOLD)
var font_19 = wx.Font(15, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
var font_21 = wx.Font(17, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
var font_27 = wx.Font(21, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)


///////////////////////
// Compiler Box
///////////////////////

var compiler_box = wx.StaticBox(panel, wx.ID_ANY, "Compiler", pos: wx.Point(10, 5), size: wx.Size(965, 138))
compiler_box.SetFont(font_19B)

var selected_file = wx.TextCtrl(compiler_box, wx.ID_ANY, "Select swift file to compile or run", pos:Point(20,37), size:Size(700,35), style:wx.TE_READONLY)
selected_file.SetFont(font_21)
selected_file.SetBackgroundColour(wx.Colour(0xFFFFFF))

var select_file_btn = wx.Button(compiler_box, id: wx.ID_ANY, label: "Select File", pos: wx.Point(725,37), 
       size: wx.Size(220,35), style:0, validator:wx.DefaultValidator, name:"buttonSelectFile")
select_file_btn.SetFont(font_19B)       

var compile_button = wx.Button(compiler_box, id: wx.ID_ANY, label: "Compile", pos: Point(20,85),
       size: wx.Size(460,40), style:0, validator:wx.DefaultValidator,
       name:"buttonCompile")
compile_button.SetFont(font_27)       

var run_button = wx.Button(compiler_box, id:wx.ID_ANY, label:"Run", pos:Point(485,85),
       size:wx.Size(460,40), style:0, validator:wx.DefaultValidator,
       name:"buttonRun")
run_button.SetFont(font_27)       


///////////////////////
// Compiler Setting Box
///////////////////////

var settings_box = wx.StaticBox(panel, wx.ID_ANY, "Compiler Settings", pos:Point(10, 150), size:Size(965, 107))
settings_box.SetFont(font_19B)

var label1_static = wx.StaticText(settings_box, wx.ID_ANY, "* double click on text field to change settings values", pos:Point(15,40), size:Size(600,35))
label1_static.SetFont(font_12)

var reset_button = TextButton(settings_box, id:wx.ID_ANY, label:"Reset settings", pos:Point(850,35),
       size:wx.Size(100,22))

var label2_static = wx.StaticText(settings_box, wx.ID_ANY, "Swift Compiler", pos:Point(15,65), size:Size(200,35))
label2_static.SetFont(font_19B)

var compiler_textctrl = wx.TextCtrl(settings_box, wx.ID_ANY, swift_compiler_exe, pos:Point(185,65), size:Size(762,30), style:wx.TE_READONLY)
compiler_textctrl.SetFont(font_19)
compiler_textctrl.SetBackgroundColour(wx.Colour(0xFFFFFF))


///////////////////////
// Logs Box
///////////////////////

var logs_box = wx.StaticBox(panel, wx.ID_ANY, "Logs", pos:Point(10, 267), size:Size(965, 257))
logs_box.SetFont(font_19B)

var log_textctrl = wx.TextCtrl(logs_box, wx.ID_ANY, "",
        pos:Point(5,22), size:Size(955,230), style:wx.BORDER_NONE|wx.TE_READONLY|wx.TE_MULTILINE)
log_textctrl.SetFont(font_log)
log_textctrl.SetBackgroundColour(wx.Colour(0xFFFFFF))


///////////////////////
// Web Links
///////////////////////

var news_button = TextButton(panel, id:wx.ID_ANY, label:"Project Latest News", pos:Point(10, 535),
       size:wx.Size(120,22))

var help_button = TextButton(panel, id:wx.ID_ANY, label:"Help", pos:Point(475,535),
       size:wx.Size(40,22))

var project_button = TextButton(panel, id:wx.ID_ANY, label:"Project Website", pos:Point(875,535),
       size:wx.Size(100,22))

///////////////////////
// Callbacks
///////////////////////

func OnSelectFile(_ event: Event) {
  let openFileDialog = wx.FileDialog(panel, "Select a source code file...", "C:\\SwiftForWindows\\My Programs", "",
                                       "Swift files (*.swift)|*.swift", wx.FD_OPEN | wx.FD_FILE_MUST_EXIST)
  if (openFileDialog.ShowModal() == wx.ID_CANCEL) {
    return
  }
  swift_source = openFileDialog.GetPath()
  selected_file.Clear()
  selected_file.AppendText(swift_source)
}

func OnProjectLatestNews(_ event: Event) {
  _ = wx.LaunchDefaultBrowser("https://swiftforwindows.codeplex.com/wikipage?title=News")
}

func OnHelp(_ event: Event) {
  _ = wx.LaunchDefaultBrowser("https://swiftforwindows.codeplex.com/wikipage?title=Help")
}

func OnProjectWebsite(_ event: Event) {
  _ = wx.LaunchDefaultBrowser("https://swiftforwindows.codeplex.com/")
}

func OnEnterLinkButton(_ event: Event) {
  if let evtobj = event.EventObject as? Window {
    evtobj.SetBackgroundColour(wx.NullColour)
    evtobj.SetWindowStyle(wx.BORDER_DEFAULT)
  }
}

func OnLeaveLinkButton(_ event: Event) {
  if let evtobj = event.EventObject as? Window {
    evtobj.SetBackgroundColour(wx.Colour(0xFFFFFF))
    evtobj.SetWindowStyle(wx.BORDER_NONE)
  }
}
  
func OnReset(_ event: Event) {
  swift_compiler_exe = init_swift_compiler_exe
  compiler_textctrl.Clear()
  compiler_textctrl.AppendText(swift_compiler_exe)
}
  
func OnCompilerSettingDblClick(_ event: Event) {
  if let evtobj = event.EventObject as? TextCtrl {
    let openFileDialog = wx.FileDialog(panel, "Select swiftc.exe file", swift_compiler_exe, "",
                                       "swiftc.exe (swiftc.exe)|swiftc.exe", wx.FD_OPEN | wx.FD_FILE_MUST_EXIST)
    if (openFileDialog.ShowModal() == wx.ID_CANCEL) {
      return
    }
    swift_compiler_exe = openFileDialog.GetPath()
    evtobj.Clear()
    evtobj.AppendText(swift_compiler_exe)
  }
}

func OnCompile(_ event: Event) {
  if String(swift_source.characters.suffix(6)) != ".swift" {
    _ = wx.MessageDialog(frame, "Select a *.swift file", "Compile", style:wx.OK).ShowModal()
    return
  }
  let len = swift_source.characters.count
  swift_out_exe = String(swift_source.characters.prefix(len - 6)) + ".exe"

  log_textctrl.Clear()
  var message : String = "TBD"
  let compiler_command = "\"" + swift_compiler_exe + "\" \"" + swift_source + "\" -o \"" + swift_out_exe + "\""
  
  let exec_output = wx.ExecuteOutErr(compiler_command)
  message = compiler_command + "\n"
  if exec_output.characters.count == 0 {
    message += "\n" + "Successfully compiled" + "\n"
  } else { 
    message += "\n" + exec_output + "\n"
    message += "\n" + "Compilation Failed" + "\n"
  }
  log_textctrl.AppendText(message)
}

func OnRun(_ event: Event) {
  if String(swift_source.characters.suffix(6)) != ".swift" {
    _ = wx.MessageDialog(frame, "Select a *.swift file", "Compile", style:wx.OK).ShowModal()
    return
  }
  if !wx.FileExists(swift_out_exe) {
    _ = wx.MessageDialog(frame, "Push Compile button first", "Run", style:wx.OK).ShowModal()
    return
  }
  log_textctrl.Clear()
  if run_in_new_window {
    let run_command = "cmd /C start /wait cmd /K \"" + swift_out_exe + "\""
    _ = wx.ExecuteOutErr(run_command)
  } else {
    let run_command = "cmd /C \"" + swift_out_exe + "\""
    let exec_output = wx.ExecuteOutErr(run_command)
    let message = exec_output
    log_textctrl.AppendText(message)
  }
}

///////////////////////
// Bindings
///////////////////////

select_file_btn.Bind(wx.EVT_BUTTON, OnSelectFile)
compile_button.Bind(wx.EVT_BUTTON, OnCompile)
run_button.Bind(wx.EVT_BUTTON, OnRun)
reset_button.Bind(wx.EVT_BUTTON, OnReset)
compiler_textctrl.Bind(wx.EVT_LEFT_DCLICK, OnCompilerSettingDblClick)
news_button.Bind(wx.EVT_BUTTON, OnProjectLatestNews)
help_button.Bind(wx.EVT_BUTTON, OnHelp)
project_button.Bind(wx.EVT_BUTTON, OnProjectWebsite)

       
///////////////////////
// Main Loop
///////////////////////
frame.Show()       

app.MainLoop()

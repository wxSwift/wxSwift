import wx
import subprocess
import pathlib

swift_source = ""
swift_exe = ""
swift_compiler_usr = "C:\\SwiftForWindows\\Swift"
slash = "\\"
run_in_new_window = True

def OnClose(event):
  print("Called OnClose")

def OnSelectFile(event):
  global panel, selected_file
  global swift_source, swift_exe
  openFileDialog = wx.FileDialog(panel, "Select a source code file...", "C:\\SwiftForWindows\\My Programs", "",
                                       "Swift files (*.swift)|*.swift", wx.FD_OPEN | wx.FD_FILE_MUST_EXIST)
  if openFileDialog.ShowModal() == wx.ID_CANCEL:
    return
  selected_file.Clear()
  selected_file.AppendText(openFileDialog.GetPath())
  swift_source = openFileDialog.GetPath()
  index = swift_source.rfind(".swift")
  swift_exe = swift_source[:index] + ".exe"

def OnProjectLatestNews(event):
  wx.LaunchDefaultBrowser("https://swiftforwindows.codeplex.com/wikipage?title=News")

def OnHelp(event):
  wx.LaunchDefaultBrowser("https://swiftforwindows.codeplex.com/wikipage?title=Help")

def OnProjectWebsite(event):
  wx.LaunchDefaultBrowser("https://swiftforwindows.codeplex.com/")

def OnEnterLinkButton(event):
  event.EventObject.SetBackgroundColour(wx.NullColour)
  event.EventObject.SetWindowStyle(wx.BORDER_DEFAULT)
  
def OnLeaveLinkButton(event):
  event.EventObject.SetBackgroundColour(wx.Colour(0xFFFFFF))
  event.EventObject.SetWindowStyle(wx.BORDER_NONE)
  
def OnReset(event):
  compiler_textctrl.Clear()
  compiler_textctrl.AppendText("C:\\SwiftForWindows\\Swift\\")
  
def OnCompilerSettingDblClick(event):
  global panel, selected_file
  global swift_compiler_usr
  openFileDialog = wx.FileDialog(panel, "Select swiftc.exe file", "C:\\SwiftForWindows\\Swift", "",
                                       "swiftc.exe (swiftc.exe)|swiftc.exe", wx.FD_OPEN | wx.FD_FILE_MUST_EXIST)
  if openFileDialog.ShowModal() == wx.ID_CANCEL:
    return
  swift_compiler_usr = openFileDialog.GetPath()
  last_slash = swift_compiler_usr.rfind(slash)
  last_2nd_slash = swift_compiler_usr.rfind(slash, 0, last_slash) + 1
  swift_compiler_usr = swift_compiler_usr[:last_2nd_slash]
  event.EventObject.Clear()
  event.EventObject.AppendText(swift_compiler_usr)

def OnCompile(event):
  global swift_source, swift_exe
  index = swift_source.rfind(".swift")
  if index == -1:
    wx.MessageDialog(frame, "Select a *.swift file", "Compile", style=wx.OK).ShowModal()
    return
  log_textctrl.Clear()
  compiler_command = [swift_compiler_usr + slash + "bin" + slash + "swiftc.exe", swift_source, '-o', swift_exe]
  err_message = subprocess.check_output(compiler_command, stderr=subprocess.STDOUT)
  message = "\"" + "\" \"".join(compiler_command) + "\"\n"
  if len(err_message) == 0:
    message += "\n" + "Successfully compiled" + "\n"
  else: 
    message += "\n" + str(err_message, 'utf-8') + "\n"
    message += "\n" + "Compilation Failed" + "\n"
  log_textctrl.AppendText(message)
  
def OnRun(event):
  global swift_source, swift_exe
  global frame
  index = swift_source.rfind(".swift")
  if index == -1:
    wx.MessageDialog(frame, "Select a *.swift file", "Compile", style=wx.OK).ShowModal()
    return
  if not pathlib.Path(swift_exe).exists():
    wx.MessageDialog(frame, "Push Compile button first", "Run", style=wx.OK).ShowModal()
    return
  log_textctrl.Clear()
  if run_in_new_window:
    run_command = ["cmd", "/C", "start", '/wait', "cmd", "/K", swift_exe]
    subprocess.check_output(run_command, stderr=subprocess.STDOUT)
  else:
    run_command = ["cmd", "/C", swift_exe]
    err_message = subprocess.check_output(run_command, stderr=subprocess.STDOUT)
    message = str(err_message, 'utf-8')
    log_textctrl.AppendText(message)
  
app = wx.App()

frame = wx.Frame(None, -1, "Swift for Windows 1.6", size=(1000, 600), style= wx.DEFAULT_FRAME_STYLE & ~wx.RESIZE_BORDER )

icon = wx.Icon("Swift_logo.svg.png.ico")
frame.SetIcon(icon)

panel = wx.Panel(frame)
panel.SetBackgroundColour(wx.Colour(0xFFFFFF))

font_log = wx.Font(9, wx.FONTFAMILY_MODERN, wx.NORMAL, wx.NORMAL)
font_12 = wx.Font(10, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
font_19B = wx.Font(15, wx.DECORATIVE, wx.NORMAL, wx.BOLD)
font_19 = wx.Font(15, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
font_21 = wx.Font(17, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
font_27 = wx.Font(21, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)
font_link = wx.Font(8, wx.DECORATIVE, wx.NORMAL, wx.NORMAL)

# Compiler Box
compiler_box = wx.StaticBox(panel, wx.ID_ANY, "Compiler", pos=(10, 5), size=(965, 138))
compiler_box.SetFont(font_19B)

selected_file = wx.TextCtrl(compiler_box, wx.ID_ANY, "Select swift file to compile or run", pos=(20,37), size=(700,35), style=wx.TE_READONLY)
selected_file.SetFont(font_21)
selected_file.SetBackgroundColour(wx.Colour(0xFFFFFF))

select_file_btn = wx.Button(compiler_box, id=wx.ID_ANY, label="Select File", pos=(725,37), 
       size=wx.Size(220,35), style=0, validator=wx.DefaultValidator,
       name="buttonSelectFile")
select_file_btn.SetFont(font_19B)       
select_file_btn.Bind(wx.EVT_BUTTON, OnSelectFile)       
       
compile_button = wx.Button(compiler_box, id=wx.ID_ANY, label="Compile", pos=(20,85),
       size=wx.Size(460,40), style=0, validator=wx.DefaultValidator,
       name="buttonCompile")
compile_button.Bind(wx.EVT_BUTTON, OnCompile)
compile_button.SetFont(font_27)       

run_button = wx.Button(compiler_box, id=wx.ID_ANY, label="Run", pos=(485,85),
       size=wx.Size(460,40), style=0, validator=wx.DefaultValidator,
       name="buttonRun")
run_button.Bind(wx.EVT_BUTTON, OnRun)
run_button.SetFont(font_27)       

# Compiler Setting Box
settings_box = wx.StaticBox(panel, wx.ID_ANY, "Compiler Settings", pos=(10, 150), size=(965, 107))
settings_box.SetFont(font_19B)

label1_static = wx.StaticText(settings_box, wx.ID_ANY, "* double click on text field to change settings values", pos=(15,40), size=(600,35))
label1_static.SetFont(font_12)

reset_button = wx.Button(settings_box, id=wx.ID_ANY, label="Reset settings", pos=(850,35),
       size=wx.Size(100,22), style=wx.BORDER_NONE, validator=wx.DefaultValidator,
       name="buttonRun")
reset_button.Bind(wx.EVT_BUTTON, OnReset)
reset_button.SetBackgroundColour(wx.Colour(0xFFFFFF))
reset_button.SetForegroundColour(wx.Colour(0xFFFF9933))
reset_button.SetFont(font_link)
reset_button.Bind(wx.EVT_ENTER_WINDOW, OnEnterLinkButton, reset_button)
reset_button.Bind(wx.EVT_LEAVE_WINDOW, OnLeaveLinkButton, reset_button)

label2_static = wx.StaticText(settings_box, wx.ID_ANY, "Swift Compiler", pos=(15,65), size=(200,35))
label2_static.SetFont(font_19B)

compiler_textctrl = wx.TextCtrl(settings_box, wx.ID_ANY, "C:\\SwiftForWindows\\Swift\\", pos=(185,65), size=(762,30), style=wx.TE_READONLY)
compiler_textctrl.SetFont(font_19)
compiler_textctrl.SetBackgroundColour(wx.Colour(0xFFFFFF))
compiler_textctrl.Bind(wx.EVT_LEFT_DCLICK, OnCompilerSettingDblClick)


# Logs Box
logs_box = wx.StaticBox(panel, wx.ID_ANY, "Logs", pos=(10, 267), size=(965, 257))
logs_box.SetFont(font_19B)

log_textctrl = wx.TextCtrl(logs_box, wx.ID_ANY, "",
        pos=(5,22), size=(955,230), style=wx.BORDER_NONE|wx.TE_READONLY|wx.TE_MULTILINE)
log_textctrl.SetFont(font_log)
log_textctrl.SetBackgroundColour(wx.Colour(0xFFFFFF))

# Http Link

news_button = wx.Button(panel, id=wx.ID_ANY, label="Project Latest News", pos=(10, 535),
       size=wx.Size(120,22), style=wx.BORDER_NONE, validator=wx.DefaultValidator,
       name="buttonRun")
news_button.SetFont(font_link)
news_button.SetBackgroundColour(wx.Colour(0xFFFFFF))
news_button.SetForegroundColour(wx.Colour(0xFFFF9933))
news_button.Bind(wx.EVT_BUTTON, OnProjectLatestNews)
news_button.Bind(wx.EVT_ENTER_WINDOW, OnEnterLinkButton, news_button)
news_button.Bind(wx.EVT_LEAVE_WINDOW, OnLeaveLinkButton, news_button)

help_button = wx.Button(panel, id=wx.ID_ANY, label="Help", pos=(475,535),
       size=wx.Size(40,22), style=wx.BORDER_NONE, validator=wx.DefaultValidator,
       name="buttonRun")
help_button.SetFont(font_link)
help_button.SetBackgroundColour(wx.Colour(0xFFFFFF))
help_button.SetForegroundColour(wx.Colour(0xFFFF9933))
help_button.Bind(wx.EVT_BUTTON, OnHelp)
help_button.Bind(wx.EVT_ENTER_WINDOW, OnEnterLinkButton, help_button)
help_button.Bind(wx.EVT_LEAVE_WINDOW, OnLeaveLinkButton, help_button)

project_button = wx.Button(panel, id=wx.ID_ANY, label="Project Website", pos=(875,535),
       size=wx.Size(100,22), style=wx.BORDER_NONE, validator=wx.DefaultValidator,
       name="buttonRun")
project_button.SetFont(font_link)
project_button.SetBackgroundColour(wx.Colour(0xFFFFFF))
project_button.SetForegroundColour(wx.Colour(0xFFFF9933))
project_button.Bind(wx.EVT_BUTTON, OnProjectWebsite)
project_button.Bind(wx.EVT_ENTER_WINDOW, OnEnterLinkButton, project_button)
project_button.Bind(wx.EVT_LEAVE_WINDOW, OnLeaveLinkButton, project_button)
       
       
frame.Show()       

app.MainLoop()
       
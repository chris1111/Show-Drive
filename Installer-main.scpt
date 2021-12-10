# Show Drive
# Copyright (c) 2021 chris1111 

set theAction to button returned of (display dialog "
You have two choices, Install Show Drive or Uninstall it.
The Icon Status Bar will be on the bar each time you log in.
Click Install to install Show Drive in your Applications
============================
" with icon note cancel button "Quit" buttons {"Install", "Uninstall", "Quit"} default button {"Install"})
{"Install", "Uninstall"}
set source to path to me as string
set source to POSIX path of source & "Contents/Resources/PackageRoot/Show Drive.app"
set source to quoted form of source
--display dialog source

if theAction = "Install" then do shell script "cp -R " & source & " /Applications/'Show Drive.app'"

delay 2
if theAction = "Install" then tell application "System Events"
	get full name of current user
	make new login item at end of login items with properties ¬
		{path:"/Applications/Show Drive.app"}
end tell

delay 1

if theAction = "Install" then do shell script "open -a /Applications/'Show Drive.app'"
if theAction = "Install" then
	display dialog "Installation Show Drive done!" with icon note buttons "Done" default button "Done" giving up after 3
end if

if theAction = "Uninstall" then do shell script "killall -c 'Show Drive'"
if theAction = "Uninstall" then do shell script "rm -rf " & " /Applications/'Show Drive.app'"
if theAction = "Uninstall" then tell application "System Events" to delete login item "Show Drive"
if theAction = "Uninstall" then display dialog "Uninstall Show Drive done!" with icon note buttons "Done" default button "Done" giving up after 3

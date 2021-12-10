set theAction to button returned of (display dialog "
Show or Hide Disks ➤ (Internal - External)
-----------------------------------------
	   
" with icon alias ((path to me) & "Contents:Resources:AppIcon.icns:" as string) buttons {"Quit", "Show", "Hide"} default button {"Show"})

if theAction = "Show" then
	do shell script "defaults write com.apple.Finder ShowHardDrivesOnDesktop TRUE"
	do shell script "defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop TRUE"
	delay 1
	do shell script "killall Finder"
end if
if theAction = "Hide" then
	do shell script "defaults write com.apple.Finder ShowHardDrivesOnDesktop FALSE"
	do shell script "defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop FALSE"
	delay 1
	do shell script "killall Finder"
	
end if

if theAction = "Quit" then
	
end if

tell application "System Events"
    -- some versions might identify as "iTerm2" instead of "iTerm"
    set isRunning to (exists (processes where name is "iTerm")) or (exists (processes where name is "iTerm2"))
end tell

-- Get hosts
set listOfShows to {}
set Shows to paragraphs of (read POSIX file "~/hosts")
repeat with nextLine in Shows
    if length of nextLine is greater than 0 then
        copy nextLine to the end of listOfShows
    end if
end repeat
set num_hosts to count listOfShows

tell application "iTerm2"
      activate
set hasNoWindows to ((count of windows) is 0)
if isRunning and hasNoWindows then
	create window with default profile
end if
select first window

-- Create new tab
tell the first window
    if isRunning and hasNoWindows is false then
       create tab with default profile
    end if
end tell

-- Prepare vertical panes
repeat with i from 1 to num_hosts
    tell session i of current tab of current window
	if i < num_hosts then
		split vertically with  profile "Default"
	end if
    end tell
end repeat

-- Login server, use write text can execute all command you want
repeat with n from 1 to num_hosts
    tell session n of current tab of current window
        write text  "/usr/local/bin/con " & (item n of listOfShows)
    end tell
end repeat

end tell

-- Get hosts
  tell application "iTerm2"
      activate
set listOfShows to {}
set Shows to paragraphs of (read POSIX file "~/hosts")
repeat with nextLine in Shows
    if length of nextLine is greater than 0 then
        copy nextLine to the end of listOfShows
    end if
end repeat
set num_hosts to count listOfShows

-- Create new tab
tell current window
		create tab with default profile
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
--     write text  "ssh " & (item n of listOfShows)
end tell
end repeat
end tell

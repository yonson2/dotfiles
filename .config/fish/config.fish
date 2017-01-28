# alias
alias vim "nvim"
alias gm "git commit -m "
alias gs "git status"
alias ga "git add "
alias reb "systemctl reboot"
alias shut "systemctl shutdown"
alias sus "systemctl suspend"

# double-bang (like in bash)
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end

# start x at login

if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end

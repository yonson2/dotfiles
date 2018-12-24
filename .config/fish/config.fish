# alias
set TERM xterm-256color
alias vim "nvim"
alias ovim "usr/bin/vim"
alias dotfiles "git --git-dir=.dotfiles.git"
alias say 'echo "$1" | espeak -v english-us -s 120 2>/dev/null'
# alias e 'emacsclient -nc -s instance1'
alias vimdiff 'nvim -d'
alias mpvtv 'mpv -audio-device=alsa/hdmi:CARD=PCH,DEV=0'

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

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

# opam configuration
# source /home/peter/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
set fish_user_paths --universal $fish_user_paths ~/bin ~/.nimble/bin ~/go/bin (npm bin -g)

# themes config
set -x SPACEFISH_KUBECONTEXT_SHOW false

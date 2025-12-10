if status is-interactive
    set -g fish_greeting ""
    if test -f ~/.aliases
        source ~/.aliases
    end
end

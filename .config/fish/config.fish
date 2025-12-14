if status is-interactive
    set -g fish_greeting ""
    set -Ux EDITOR nvim
    set -Ux Visual nvim
    fish_vi_key_bindings

    if test -f ~/.aliases
        source ~/.aliases
    end

    if command -q dircolors
        eval (dircolors -c ~/.dircolors)
    end

    set -g fish_color_command 8abeb7
    set -g fish_color_autosuggestion a8a8a8
    set -g fish_color_param d0d0d0
    set -g fish_color_quote b6bd68
    set -g fish_color_error cc6766
    set -g fish_color_cwd de945f
    set -g fish_color_comment a8a8a8 '--italics'
    set -g fish_color_redirection 8abeb7
end

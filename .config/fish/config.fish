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

    # Theme
    set -g fish_color_command 669985
    set -g fish_color_param d0d0d0
    set -g fish_color_quote 669985
    set -g fish_color_error a87878
    set -g fish_color_comment a87878
    set -g fish_color_redirection 669985
end

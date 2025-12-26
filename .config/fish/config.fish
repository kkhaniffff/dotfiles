if status is-interactive
    set -g fish_greeting ""
    set -Ux EDITOR nvim
    set -Ux Visual nvim
    fish_vi_key_bindings

    if test -f ~/.aliases
        source ~/.aliases
    end

    if test -f ~/.config/ls_colors
        set -x LS_COLORS (cat ~/.config/ls_colors)
    end

    # Theme
    set -g fish_color_normal DADADA
    set -g fish_color_command 5C9A8E
    set -g fish_color_param B0B0B0
    set -g fish_color_keyword 5C9A8E
    set -g fish_color_quote 9ECE6A
    set -g fish_color_redirection E0AF68
    set -g fish_color_end B0B0B0
    set -g fish_color_error E46876
    set -g fish_color_comment B0B0B0
    set -g fish_color_autosuggestion B0B0B0
    set -g fish_pager_color_progress B0B0B0
    set -g fish_pager_color_background --background=1E1E1E
    set -g fish_pager_color_secondary_background --background=262626
end

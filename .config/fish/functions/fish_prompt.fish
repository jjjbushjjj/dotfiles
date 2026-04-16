function fish_prompt
    set_color brblue
    echo -n (prompt_pwd)
    set_color normal
    fish_vcs_prompt
    echo

    set_color -o green
    echo -n '❯ '
    set_color normal
end


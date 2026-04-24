if status is-interactive
  set -g fish_greeting
  abbr -a v nvim
  fzf_key_bindings
  fish_vi_key_bindings
    # Commands to run in interactive sessions can go here
end

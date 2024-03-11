# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/.scripts:" ]]
then
    PATH="$HOME/.local/bin:$HOME/.scripts:$PATH"
fi
export PATH
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export WINIT_UNIX_BACKEND=x11

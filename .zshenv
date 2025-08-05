# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/.scripts:" ]]
then
    PATH="$HOME/.local/bin:$HOME/.scripts:$PATH"
fi
export PATH
export EDITOR=nvim

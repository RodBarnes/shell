# shell
These scripts are used to set up the environment on remote systems to more clearly identify that system when one has `ssh`'d to it.  They are written for and tested on debian-based distro but the concept should work on any distro.

## remote_bashrc
This is a standard `.bashrc` I use on my debian servers that `source`s `.ssh_color.sh`.  The pertinent lines are these:
```
# Load SSH-specific background + prompt colors
[[ -f ~/.ssh_colors.sh ]] && . ~/.ssh_colors.sh
```

## ssh_colors.sh
This sets the background and prompt colors, and the terminal title.
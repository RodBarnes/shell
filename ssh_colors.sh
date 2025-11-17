
# Only interactive shells
[[ $- != *i* ]] && return

# Set the exit function
trap reset_bg EXIT INT

# Default background color
background_default='#2e3436'

# Set 1 for bold; 0 for regular
prompt_bold='1;'

# Functions
set_bg() { printf '\033]11;%s\007' "$1"; }
reset_bg() { printf '\033]11;#2e3436\007'; }

# Determine the host
case "$(hostname -s)" in
    boss)
      background_color='#5F2F00'  # dark orangerust
      prompt_color='1;38;5;220'   # bright yellow
      ;;
    shrek)
      background_color='#113300'  # green
      prompt_color='1;38;5;76'    # bright green
      ;;
    *)
      background_color='#2e3436'  # gray
      prompt_color='1;38;5;140'   # lavender
      ;;
esac

# Set the background color and prompt
set_bg "rgb:${background_color#\#}"
PS1="\[\e[${prompt_color}m\]\u@\h:\w\$\[\e[0m\] "

# Set the terminal title
case "$TERM" in
    xterm*|rxvt*|gnome*|konsole*|screen*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

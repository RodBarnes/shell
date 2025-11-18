
# Only interactive shells
[[ $- != *i* ]] && return

# Set the exit function
trap reset_background EXIT INT

# Default background color
background_default='#2e3436'

# Set 1 for bold; 0 for regular
prompt_bold='1;'

# Functions
set_background() { printf '\033]11;%s\007' "$1"; }
reset_background() { printf '\033]11;#2e3436\007'; }

# Determine the host
case "$(hostname -s)" in
    boss|boss-recovery)
      background_color='#5F2F00'  # dark orange
      prompt_color='1;38;5;220'   # bright yellow
      ;;
    shrek|shrek-recovery)
      background_color='#113300'  # green
      prompt_color='1;38;5;76'    # bright green
      ;;
    media)
      background_color='#00005f'  # dark blue
      prompt_color='1;38;5;117'   # bright blue
      ;;
    *)
      background_color='#2e3436'  # gray
      prompt_color='1;38;5;140'   # lavender
      ;;
esac

# Set the background color and prompt
set_background "rgb:${background_color#\#}"
PS1="\[\e[${prompt_color}m\]\u@\h:\w\$\[\e[0m\] "


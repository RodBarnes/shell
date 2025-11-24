#!/usr/bin/env bash
# ~/.bin/ssh   (or any name you like — just alias ssh to it)
# Make executable: chmod +x ~/.bin/ssh

# Extract the hostname you are connecting to (handles user@host, host, host.domain, etc.)
TARGET="${1##*@}"      # strip anything before @
TARGET="${TARGET%%.*}" # strip domain if present

case "$TARGET" in
  ardor)                PROFILE="ardor"  ;;
  media)                PROFILE="media"  ;;
  shrek|shrek-recovery) PROFILE="shrek"  ;;
  boss|boss-recovery)   PROFILE="boss"   ;;
  *)                    PROFILE="Default" ;;
esac

# Option A (recommended): open a NEW tab with the correct profile
# This is what 99 % of GNOME Terminal users actually want
# gnome-terminal --profile="$PROFILE" -- ssh "$@" &
# exec gnome-terminal --profile="$PROFILE" -- bash -c "ssh $*; exec bash"
# gnome-terminal --tab --profile="$PROFILE" -- ssh "$@"

gnome-terminal --profile="$PROFILE" -- ssh "$@"

# exit 0
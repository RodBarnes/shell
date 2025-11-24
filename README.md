# shell
These scripts are used to set up the environment on remote systems to more clearly identify that system when one has `ssh`'d to it.  They are written for and tested on debian-based distro but the concept should work on any distro.

## remote_bashrc
This is a standard `.bashrc` I use on my debian servers that does NOT change the prompt color if the session was opened via `ssh`  The pertinent lines are these:
```
# If coming in via ssh, do NOT change the prompt colors; they are set by the profile
if [[ ! -n "$SSH_CLIENT" ]] && [[ ! -n "$SSH_TTY" ]] && [[ ! -n "$SSH_CONNECTION" ]]; then
	if [ "$color_prompt" = yes ]; then
    	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	else
    	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	fi
fi
```

## ssh.sh
This selects the terminal profile based upon the hostname, and then does an ssh to that host.
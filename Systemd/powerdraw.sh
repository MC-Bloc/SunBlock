#!/bin/bash
#
# Installation:
# 1. put this script somewhere in your path - `/usr/local/bin/powerdraw` is probably
#    a good idea.
# 2. Give the script execution permissions, e.g. `sudo chmod a+x /usr/local/bin/powerdraw`
# 3. Optional - add a sudoers file to allow users to execute this file without typing their
#    password over and over. For example, create `/etc/sudoers.d/allow-powerdraw` with the
#    following content:
#        %admin ALL = NOPASSWD: /usr/local/bin/powerdraw, /usr/local/bin/powerdraw -f
#
# ### NOTE ###
# This script uses powercap driver's energy_ju file to read power usage.
# That file is only readable to the root user, so this script start by
# trying to gain super use privileges using the following strategy:
# 1. If this script was already run with root permissions, just continue.
# 2. If running this script is listed as sudo capability for the current user, use sudo
# 3. If the script runs under a graphical environment with a pseudo terminal, use sudo
# 4. If the script runs under a graphical environment w/o a pseudo terminal, use pkexec
# 5. If the script runs without a graphical environment, use sudo.
# 
# If something doesn't work, first check that the script knows how to use the correct su
# command and that it works.

function usage() {
	local msg="$*"
	(
		[ -n "$msg" ] && echo "Error: $msg"
		echo "Usage $0 [<options>]"
		echo ""
		echo "Options:"
		echo "	-f : continously output the current draw every second"
	) >&2
	exit 5
}

function scan_caps() {
	find /sys/devices/virtual/powercap -name name | while read path; do
		grep -q intel-rapl-mmio <<<"$path" && continue # ignore intel-rapl-mmio as its just a duplicate of intel-rapl (I think)
		grep -q core "$path" && continue # "core"/"uncore" are summed in "package"
		grep -q psys "$path" && continue # psys is a mystery?
		fname="$(dirname $path)/energy_uj"
		[ -e "$fname" ] && echo $fname
	done
}

# switch to super user if needed - we can't read powercap's "energy_uj" without SYS_ADMIN_CAP
if [ $(id -u) != 0 ]; then
	sudo -l | grep -q $0 && exec sudo "$0" "$@"
	if [ -n "$WAYLAND_DISPLAY" -o -n "$DISPLAY" ]; then
		case "$(tty)" in
		*pts*) exec sudo "$0" "$@";;
		*) exec pkexec "$0" "$@";;
		esac
	else
		exec sudo "$0" "$@"
	fi
fi

CLIARGS=( "" "$@" ) # OPTIND is 1 based
ARGS=()
FOLLOW=
while [ "$OPTIND" -lt "${#CLIARGS[*]}" ]; do
	if getopts "hf" OPT; then
		case $OPT in
			f) FOLLOW=1;;
			h) usage;;
			*) usage invalid arg $OPT;;
		esac
	else
		ARGS+=( "${CLIARGS[$OPTIND]}" )
		OPTIND=$(( $OPTIND + 1 ))
	fi
done

caps=( $(scan_caps) )
vals=()
con=()

while true; do
	sum=0
	for (( i = 0; i < ${#caps[@]}; i++ )); do
		if [ -n "${vals[$i]}" ]; then
			con[$i]=$(( $(cat ${caps[$i]}) - ${vals[$i]} ))
			sum=$(( sum + ${con[$i]} ))
		fi
		vals[$i]=$(cat ${caps[$i]})
	done
	
	if [ "$sum" != 0 ]; then
	    awk '{print $1*10^-6 "W"}' <<<$sum
	    [ -z "$FOLLOW" ] && break;
	fi
	
	sleep 1
done

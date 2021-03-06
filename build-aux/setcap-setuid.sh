#!/bin/sh
#
# Meson install script to setcap or setuid to an executable.

exec_path="$1/$2"
perm_type="$3"
setcap="$4"

case "$perm_type" in
	'caps')
		echo "$0: calling: $setcap cap_net_raw+ep $exec_path"
		"$setcap" 'cap_net_raw+ep' "$exec_path" || true
	;;
	'setuid')
		echo "$0: changing $exec_path to be setuid root executable"
		chown root "$exec_path" || true
		chmod u+s "$exec_path" || true
	;;
	*)
		echo "$0: unexpected argument: $perm_type"
		exit 1
	;;
esac

exit 0

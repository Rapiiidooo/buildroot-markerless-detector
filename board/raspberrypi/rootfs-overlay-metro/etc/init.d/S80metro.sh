#! /bin/sh
#
# Starts metro
#

start() {
	/bin/metro
}

case "$1" in
	start)
		start
		;;
	*)
	echo "Usage: $0 {start}"
	exit 1
esac

exit $?

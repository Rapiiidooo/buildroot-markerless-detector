#! /bin/sh
#
# Starts metro
#

start() {
	/bin/metro
}

stop() {
	# Somewhat hackish, but this was only way I could think of :)
	line=`ps | grep metro`
	pid=`echo $line | cut -d ' ' -f 1`
	kill $pid
	sleep 1
	echo "OK"
}

restart() {
	stop
	start
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart|reload)
		restart
		;;
	*)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?

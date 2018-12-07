#!/bin/sh
#
# Keyboard AZERTY
#
case "$1" in
start)
echo 
-
n "Keyboard disposition : AZERTY: "
loadkmap < /etc/azerty.kmap
echo "OK"
;;
*)
echo "Usage: $0 {start}"
exit 1
esac
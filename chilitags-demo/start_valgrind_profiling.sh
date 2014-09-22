#!/usr/bin/env bash

PACKAGE="ch.epfl.chilitags_demo"

adb root

adb push start_valgrind.sh /data/local/
adb shell chmod 777 /data/local/start_valgrind.sh

adb shell setprop wrap.$PACKAGE "logwrapper /data/local/start_valgrind.sh"

echo "wrap.$PACKAGE: $(adb shell getprop wrap.$PACKAGE)"

adb shell am force-stop $PACKAGE
adb shell am start -a android.intent.action.MAIN -n $PACKAGE/.QtActivity

adb logcat -c
adb logcat

exit 0


#!/system/bin/sh

PACKAGE="ch.epfl.chilitags_demo"

# Callgrind tool
VGPARAMS='-v --instr-atstart=no --error-limit=no --trace-children=yes --log-file=/sdcard/valgrind.log.%p --tool=callgrind --callgrind-out-file=/sdcard/callgrind.out.%p --vgdb=yes'

export TMPDIR=/data/data/$PACKAGE
export USER=root
export HOSTNAME=t0lte

exec su -c valgrind $VGPARAMS $* 


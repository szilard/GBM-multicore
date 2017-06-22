#!/bin/bash

# Example: ./run.sh r3_8x h2o

INSTANCE=$1
TOOL=$2

LOG=res-$INSTANCE-$TOOL.log
rm -f $LOG

for CORES in $(cat cores-$INSTANCE.conf); do
  NCORES=$(echo $CORES | cut -d: -f1)
  LCORES=$(echo $CORES | cut -d: -f2)
  for i in {1..3}; do
    echo CORES:$CORES >> $LOG
    RUNTIME=$(taskset -c $LCORES Rscript tool-$TOOL.R $NCORES 2>&1 | tee -a $LOG | tail -1)
    echo $INSTANCE:$TOOL:$NCORES:$LCORES:$RUNTIME
  done
done


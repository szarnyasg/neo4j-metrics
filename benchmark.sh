#!/bin/bash

NEO4J_SHELL="$NEO4J_HOME/bin/neo4j-shell -file"

for metric in *.cyp; do
  metric="${metric%.*}"
  echo $metric
  /usr/bin/time -f "%e" $NEO4J_SHELL $metric.cyp 2>&1 > /dev/null
done

#!/bin/bash

NEO4J_SHELL="$NEO4J_HOME/bin/neo4j-shell -file"
METRICS=(c dc1 dimensional-degree dimensional-metrics mpc na)

for metric in ${METRICS[@]}; do
  echo $metric
  time $NEO4J_SHELL $metric.cyp 2>&1 > /dev/null| grep real
done

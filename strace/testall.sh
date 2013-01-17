#!/bin/bash

for f in tests-sbox/*.sh; do
  OUT=$(mktemp /tmp/`basename $f`-out-XXXXX)
  ERR=$(mktemp /tmp/`basename $f`-err-XXXXX)
  printf "Testing %-35s ... " "$f"
  (./strace -t $f 1>$OUT 2>$ERR) || {
    echo "ERR"
    echo ">> stdout:"
    cat $OUT
    echo ">> stderr:"
    cat $ERR
    exit 1
  }
  rm -f $OUT
  rm -f $ERR
  echo "OK"
done
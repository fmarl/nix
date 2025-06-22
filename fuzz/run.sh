#!/bin/sh

let CORES=$(nproc)-1

for i in $(seq 1 $CORES);
do
    AFL_MAP_SIZE=651557 AFL_SKIP_BIN_CHECK=1 afl-fuzz -i in/ -o out -M fuzzer$i  -- ./harness.sh @@ > /dev/null &
done

AFL_MAP_SIZE=651557 AFL_SKIP_BIN_CHECK=1 afl-fuzz -i in/ -o out -M fuzzer0  -- ./harness.sh @@ > /dev/null &
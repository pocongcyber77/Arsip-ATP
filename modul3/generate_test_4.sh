#!/bin/bash

# Generator untuk test case Soal 4
# Usage: ./generate_test_4.sh <N> <Q>
# Example: ./generate_test_4.sh 1000 100

N=${1:-100}      # Default N=100
Q=${2:-50}       # Default Q=50

echo "$N $Q"

# Generate array (1-indexed values from 1 to N)
for ((i=1; i<=N; i++)); do
    echo -n "$((RANDOM % N + 1))"
    if [ $i -lt $N ]; then
        echo -n " "
    fi
    # New line every 20 numbers for readability (optional)
    if [ $((i % 20)) -eq 0 ] && [ $i -lt $N ]; then
        echo ""
    fi
done
echo ""

# Generate queries
for ((i=1; i<=Q; i++)); do
    L=$((RANDOM % N + 1))
    maxR=$((N - L + 1))
    if [ $maxR -gt 0 ]; then
        R=$((L + RANDOM % maxR))
    else
        R=$L
    fi
    echo "$L $R"
done


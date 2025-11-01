#!/bin/bash

echo "=== Complexity Testing ==="
echo ""

test_program() {
    local prog=$1
    local testfile=$2
    local progname=$3
    
    echo "Testing $progname..."
    
    if [ "$progname" == "Soal 2" ] || [ "$progname" == "Soal 5" ]; then
        # Simple input format
        total=0
        count=0
        while IFS= read -r line; do
            if [ -n "$line" ]; then
                runtime=$( (time echo "$line" | ./$prog > /dev/null 2>&1) 2>&1 | grep real | awk '{print $2}')
                count=$((count + 1))
            fi
        done < "$testfile"
        echo "Total tests: $count"
    else
        # Complex input format (Soal 4)
        echo "Running complex test..."
        time ./$prog < "$testfile" > /dev/null 2>&1
    fi
    echo ""
}

test_program "soal_2" "test_soal_2.txt" "Soal 2"
test_program "soal_4" "test_soal_4.txt" "Soal 4"
test_program "soal_5" "test_soal_5.txt" "Soal 5"

echo "=== Complexity Testing Selesai ==="


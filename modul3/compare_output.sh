#!/bin/bash

echo "=== Output Comparison ==="
echo ""

# Soal 2
echo "Comparing Soal 2 outputs..."
line_num=1
while IFS= read -r line; do
    if [ -n "$line" ]; then
        output=$(echo "$line" | ./soal_2)
        echo "Test case $line_num: Input=$line"
        echo "Output: $output"
        echo ""
        line_num=$((line_num + 1))
    fi
done < test_soal_2.txt

# Soal 5
echo "Comparing Soal 5 outputs..."
line_num=1
while IFS= read -r line; do
    if [ -n "$line" ]; then
        output=$(echo "$line" | ./soal_5)
        echo "Test case $line_num: Input=$line"
        echo "Output: $output"
        echo ""
        line_num=$((line_num + 1))
    fi
done < test_soal_5.txt

echo "=== Comparison Selesai ==="


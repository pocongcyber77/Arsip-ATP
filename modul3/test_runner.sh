#!/bin/bash

echo "=== Automated Testing ==="
echo ""

# Test Soal 2
echo "Testing Soal 2..."
while IFS= read -r line; do
    if [ -n "$line" ]; then
        echo "Input: $line"
        echo "$line" | ./soal_2
        echo ""
    fi
done < test_soal_2.txt

# Test Soal 4 (perlu penanganan khusus karena format kompleks)
echo "Testing Soal 4..."
./soal_4 < test_soal_4.txt
echo ""

# Test Soal 5
echo "Testing Soal 5..."
while IFS= read -r line; do
    if [ -n "$line" ]; then
        echo "Input: $line"
        echo "$line" | ./soal_5
        echo ""
    fi
done < test_soal_5.txt

echo "=== Testing Selesai ==="


#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=========================================="
echo "  COMPREHENSIVE TESTING SUITE"
echo "=========================================="
echo ""

# Function to test a program
test_program() {
    local prog=$1
    local testfile=$2
    local name=$3
    
    echo -e "${YELLOW}Testing $name...${NC}"
    
    if [ ! -f "./$prog" ]; then
        echo -e "${RED}ERROR: $prog not found! Compile first.${NC}"
        return 1
    fi
    
    if [ ! -f "$testfile" ]; then
        echo -e "${RED}ERROR: $testfile not found!${NC}"
        return 1
    fi
    
    # Time the execution
    start_time=$(date +%s.%N)
    
    if [ "$name" == "Soal 2" ] || [ "$name" == "Soal 5" ]; then
        # Simple input format
        count=0
        while IFS= read -r line; do
            if [ -n "$line" ]; then
                echo "$line" | ./$prog > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    count=$((count + 1))
                fi
            fi
        done < "$testfile"
        echo "  Passed: $count test cases"
    else
        # Complex input format
        ./$prog < "$testfile" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo -e "  ${GREEN}✓ Execution successful${NC}"
        else
            echo -e "  ${RED}✗ Execution failed${NC}"
        fi
    fi
    
    end_time=$(date +%s.%N)
    elapsed=$(echo "$end_time - $start_time" | bc -l 2>/dev/null || echo "N/A")
    echo "  Time elapsed: ${elapsed}s"
    echo ""
}

# Compile programs
echo -e "${YELLOW}Compiling programs...${NC}"
gcc soal_2.c.c -o soal_2 -Wall -Wextra -O2 2>&1 | grep -v "warning:" || true
gcc soal_4.c.c -o soal_4 -Wall -Wextra -O2 -lm 2>&1 | grep -v "warning:" || true
gcc soal_5.c.c -o soal_5 -Wall -Wextra -O2 2>&1 | grep -v "warning:" || true
echo ""

# Run tests
test_program "soal_2" "test_soal_2.txt" "Soal 2"
test_program "soal_4" "test_soal_4.txt" "Soal 4"
test_program "soal_5" "test_soal_5.txt" "Soal 5"

echo "=========================================="
echo -e "${GREEN}Testing Complete!${NC}"
echo "=========================================="


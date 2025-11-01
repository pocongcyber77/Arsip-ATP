# README - Dokumentasi Testing dan Command Linux

Dokumentasi lengkap untuk testing, benchmarking, dan validasi program competitive programming.

---

## 📋 Daftar Isi

1. [Persiapan](#persiapan)
2. [Compile Program](#compile-program)
3. [Testing Dasar](#testing-dasar)
4. [Automated Testing](#automated-testing)
5. [Complexity Testing (Waktu Eksekusi)](#complexity-testing-waktu-eksekusi)
6. [Stress Testing](#stress-testing)
7. [Memory Testing](#memory-testing)
8. [Output Comparison](#output-comparison)
9. [Script Testing Otomatis](#script-testing-otomatis)
10. [Troubleshooting](#troubleshooting)

---

## 🔧 Persiapan

### Install Dependencies

```bash
# Pastikan gcc sudah terinstall
gcc --version

# Jika belum, install gcc:
sudo apt-get update
sudo apt-get install build-essential

# Install tools untuk testing
sudo apt-get install time bc diffutils
```

### Struktur File

```
Modul3_ZOY_5027241024/
├── soal_2.c.c          # Program konversi waktu
├── soal_4.c.c          # Program counting inversions
├── soal_5.c.c          # Program bilangan Catalan
├── test_soal_2.txt     # Input test cases untuk soal 2
├── test_soal_4.txt     # Input test cases untuk soal 4
├── test_soal_5.txt     # Input test cases untuk soal 5
└── README_TESTING.md   # File ini
```

---

## 🏗️ Compile Program

### Compile Soal 2

```bash
gcc soal_2.c.c -o soal_2 -Wall -Wextra -O2
```

**Penjelasan Flags:**
- `-Wall`: Enable semua warning umum
- `-Wextra`: Enable warning tambahan
- `-O2`: Optimasi level 2 (untuk production/testing)

### Compile Soal 4

```bash
gcc soal_4.c.c -o soal_4 -Wall -Wextra -O2 -lm
```

**Penjelasan:**
- `-lm`: Link dengan math library (untuk sqrt)

### Compile Soal 5

```bash
gcc soal_5.c.c -o soal_5 -Wall -Wextra -O2
```

### Compile Semua Sekaligus

```bash
# Menggunakan loop
for i in 2 4 5; do
    if [ $i -eq 4 ]; then
        gcc soal_${i}.c.c -o soal_${i} -Wall -Wextra -O2 -lm
    else
        gcc soal_${i}.c.c -o soal_${i} -Wall -Wextra -O2
    fi
done
```

### Compile dengan Debugging Symbols

```bash
# Untuk debugging dengan gdb
gcc soal_2.c.c -o soal_2_debug -g -Wall -Wextra -O0
```

---

## 🧪 Testing Dasar

### Manual Testing dengan File Input

#### Soal 2: Test Single Input

```bash
# Test dengan satu input
echo "125" | ./soal_2

# Output yang diharapkan: 2 jam 5 menit
```

#### Soal 2: Test dari File

```bash
# Test dengan file (baris pertama)
head -n 1 test_soal_2.txt | ./soal_2

# Test dengan baris tertentu (contoh baris ke-3)
sed -n '3p' test_soal_2.txt | ./soal_2

# Test semua input dari file (satu per satu)
while IFS= read -r line; do
    echo "Input: $line"
    echo "$line" | ./soal_2
    echo "---"
done < test_soal_2.txt
```

#### Soal 4: Test dengan File

```bash
# Test dengan file (format kompleks dengan N Q, array, queries)
./soal_4 < test_soal_4.txt

# Atau jika ingin test per test case, perlu split file terlebih dahulu
```

#### Soal 5: Test dari File

```bash
# Test dengan satu input
echo "5" | ./soal_5

# Test semua input dari file
while IFS= read -r line; do
    echo "$line" | ./soal_5
done < test_soal_5.txt
```

### Save Output ke File

```bash
# Soal 2
./soal_2 < test_soal_2.txt > output_soal_2.txt

# Soal 4
./soal_4 < test_soal_4.txt > output_soal_4.txt

# Soal 5
./soal_5 < test_soal_5.txt > output_soal_5.txt
```

---

## 🤖 Automated Testing

### Script Testing Otomatis

Buat file `test_runner.sh`:

```bash
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
```

**Jalankan script:**
```bash
chmod +x test_runner.sh
./test_runner.sh
```

---

## ⏱️ Complexity Testing (Waktu Eksekusi)

### Menggunakan `time` Command

#### Basic Time Measurement

```bash
# Soal 2 - Single test
time echo "1440" | ./soal_2

# Output akan menampilkan:
# real    0m0.001s  (wall clock time)
# user    0m0.001s  (CPU time used by user)
# sys     0m0.000s  (CPU time used by system)
```

#### Average Time untuk Multiple Tests

```bash
# Test Soal 2 dengan semua input dan hitung rata-rata
echo "Testing Soal 2 (Average Time):"
total_time=0
count=0
while IFS= read -r line; do
    if [ -n "$line" ]; then
        runtime=$( (time echo "$line" | ./soal_2 > /dev/null) 2>&1 | grep real | awk '{print $2}' | sed 's/[ms]//g' | awk -F: '{if (NF==2) print $1*60+$2; else print $1}')
        total_time=$(echo "$total_time + $runtime" | bc)
        count=$((count + 1))
    fi
done < test_soal_2.txt
avg_time=$(echo "scale=6; $total_time / $count" | bc)
echo "Average execution time: ${avg_time}s"
```

#### Time dengan Format yang Lebih Detail

```bash
# Format time yang lebih detail
/usr/bin/time -f "Real: %E\nUser: %U\nSystem: %S\nMax Memory: %M KB" echo "125" | ./soal_2
```

### Batch Timing Script

Buat file `time_test.sh`:

```bash
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
                runtime=$( (time echo "$line" | ./$prog > /dev/null) 2>&1 | grep real | awk '{print $2}' | sed 's/[ms]//g')
                total=$(echo "$total + $runtime" | bc -l 2>/dev/null || echo "$total")
                count=$((count + 1))
            fi
        done < "$testfile"
        echo "Total tests: $count"
    else
        # Complex input format (Soal 4)
        echo "Running complex test..."
        time ./$prog < "$testfile" > /dev/null
    fi
    echo ""
}

test_program "soal_2" "test_soal_2.txt" "Soal 2"
test_program "soal_4" "test_soal_4.txt" "Soal 4"
test_program "soal_5" "test_soal_5.txt" "Soal 5"

echo "=== Complexity Testing Selesai ==="
```

**Jalankan:**
```bash
chmod +x time_test.sh
./time_test.sh
```

### Time dengan Various Input Sizes

```bash
# Test Soal 4 dengan berbagai ukuran input
# Buat generator untuk test case besar

# Small test (N=10, Q=5)
echo "10 5
1 2 3 4 5 6 7 8 9 10
1 10
2 5
3 7
1 5
6 10" | time ./soal_4

# Medium test (N=100, Q=10)
# Buat file test_soal_4_medium.txt lalu:
time ./soal_4 < test_soal_4_medium.txt

# Large test (N=10000, Q=100)
# Buat file test_soal_4_large.txt lalu:
time ./soal_4 < test_soal_4_large.txt
```

---

## 💥 Stress Testing

### Generate Large Test Cases

#### Generator untuk Soal 2

```bash
# Generate random input untuk soal 2 (0-1440)
for i in {1..1000}; do
    echo $((RANDOM % 1441))
done > stress_test_soal_2.txt

# Test dengan stress test
time ./soal_2 < stress_test_soal_2.txt > /dev/null
```

#### Generator untuk Soal 4

Buat file `generate_test_4.sh`:

```bash
#!/bin/bash

N=${1:-100}      # Default N=100
Q=${2:-50}       # Default Q=50

echo "$N $Q"

# Generate array
for ((i=1; i<=N; i++)); do
    echo -n "$((RANDOM % N + 1)) "
    if [ $((i % 20)) -eq 0 ]; then
        echo ""
    fi
done
echo ""

# Generate queries
for ((i=1; i<=Q; i++)); do
    L=$((RANDOM % N + 1))
    R=$((L + RANDOM % (N - L + 1)))
    echo "$L $R"
done
```

**Gunakan:**
```bash
chmod +x generate_test_4.sh
./generate_test_4.sh 1000 100 > stress_test_soal_4.txt
time ./soal_4 < stress_test_4.txt
```

#### Generator untuk Soal 5

```bash
# Generate sequential test (sudah ada di test_soal_5.txt)
# Atau generate random valid range (1-34)
for i in {1..100}; do
    echo $((RANDOM % 34 + 1))
done > stress_test_soal_5.txt

time ./soal_5 < stress_test_soal_5.txt > /dev/null
```

### Multiple Runs untuk Consistency Check

```bash
# Run program beberapa kali dan cek konsistensi
for i in {1..10}; do
    echo "Run $i:"
    time echo "125" | ./soal_2
    echo ""
done
```

---

## 💾 Memory Testing

### Menggunakan `valgrind` (jika tersedia)

```bash
# Install valgrind
sudo apt-get install valgrind

# Memory leak detection
valgrind --leak-check=full --show-leak-kinds=all ./soal_2 < test_soal_2.txt

# Memory usage tracking
valgrind --tool=massif ./soal_4 < test_soal_4.txt
ms_print massif.out.* > memory_report.txt
```

### Menggunakan `/usr/bin/time`

```bash
# Memory usage dengan time
/usr/bin/time -v echo "125" | ./soal_2

# Output akan menampilkan:
# Maximum resident set size (kbytes): 1234
# Average resident set size (kbytes): 567
```

### Monitor Memory secara Real-time

```bash
# Monitor memory usage saat program running
watch -n 0.1 'ps aux | grep soal_2 | grep -v grep'
```

---

## 📊 Output Comparison

### Compare Output dengan Expected

```bash
# Buat file expected output terlebih dahulu
echo "2 jam 5 menit" > expected_soal_2_1.out

# Run program dan compare
echo "125" | ./soal_2 > actual_soal_2_1.out
diff expected_soal_2_1.out actual_soal_2_1.out

# Jika sama, tidak ada output
# Jika berbeda, akan menampilkan perbedaan
```

### Batch Comparison Script

Buat file `compare_output.sh`:

```bash
#!/bin/bash

echo "=== Output Comparison ==="

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

echo "=== Comparison Selesai ==="
```

---

## 🔄 Script Testing Otomatis Lengkap

Buat file `full_test.sh` yang comprehensive:

```bash
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
    elapsed=$(echo "$end_time - $start_time" | bc)
    echo "  Time elapsed: ${elapsed}s"
    echo ""
}

# Compile programs
echo -e "${YELLOW}Compiling programs...${NC}"
gcc soal_2.c.c -o soal_2 -Wall -Wextra -O2 2>&1 | grep -v "warning:"
gcc soal_4.c.c -o soal_4 -Wall -Wextra -O2 -lm 2>&1 | grep -v "warning:"
gcc soal_5.c.c -o soal_5 -Wall -Wextra -O2 2>&1 | grep -v "warning:"
echo ""

# Run tests
test_program "soal_2" "test_soal_2.txt" "Soal 2"
test_program "soal_4" "test_soal_4.txt" "Soal 4"
test_program "soal_5" "test_soal_5.txt" "Soal 5"

echo "=========================================="
echo -e "${GREEN}Testing Complete!${NC}"
echo "=========================================="
```

**Jalankan:**
```bash
chmod +x full_test.sh
./full_test.sh
```

---

## 🐛 Troubleshooting

### Program Tidak Bisa Dicompile

```bash
# Check error messages
gcc soal_2.c.c -o soal_2 2>&1 | head -20

# Check syntax errors
gcc -fsyntax-only soal_2.c.c

# Check dengan pedantic mode
gcc -pedantic -Wall -Wextra soal_2.c.c -o soal_2
```

### Program Crash atau Segmentation Fault

```bash
# Run dengan gdb
gdb ./soal_2
(gdb) run < test_soal_2.txt
(gdb) backtrace

# Atau dengan valgrind
valgrind ./soal_2 < test_soal_2.txt
```

### Program Terlalu Lambat

```bash
# Profile dengan gprof
gcc -pg soal_4.c.c -o soal_4 -O2 -lm
./soal_4 < test_soal_4.txt
gprof ./soal_4 gmon.out > profile.txt
cat profile.txt
```

### Check Input Format

```bash
# Verify input file format
cat -A test_soal_2.txt  # Show hidden characters
od -c test_soal_2.txt   # Show octal dump

# Check line endings
file test_soal_2.txt
```

---

## 📝 Quick Reference Commands

### Compile
```bash
gcc soal_2.c.c -o soal_2 -Wall -Wextra -O2
gcc soal_4.c.c -o soal_4 -Wall -Wextra -O2 -lm
gcc soal_5.c.c -o soal_5 -Wall -Wextra -O2
```

### Test Single Input
```bash
echo "125" | ./soal_2
echo "5" | ./soal_5
```

### Test from File
```bash
./soal_2 < test_soal_2.txt
./soal_4 < test_soal_4.txt
./soal_5 < test_soal_5.txt
```

### Time Measurement
```bash
time echo "125" | ./soal_2
/usr/bin/time -v echo "125" | ./soal_2
```

### Save Output
```bash
./soal_2 < test_soal_2.txt > output.txt
```

### Compare Output
```bash
diff expected.txt actual.txt
```

---

## 🎯 Best Practices untuk Competitive Programming Testing

1. **Selalu test dengan berbagai ukuran input** (small, medium, large)
2. **Test edge cases** (minimum, maximum, boundary values)
3. **Check time complexity** dengan input besar
4. **Verify output format** sesuai spesifikasi
5. **Test dengan berbagai compiler flags** (-O0, -O2)
6. **Monitor memory usage** untuk large inputs
7. **Automate testing** sebanyak mungkin
8. **Keep test cases** untuk regression testing

---

## 📚 Referensi Tambahan

- **GCC Manual**: `man gcc`
- **Time Command**: `man time`
- **Valgrind Manual**: `man valgrind`
- **GDB Debugger**: `man gdb`

---

**Last Updated**: $(date)

**Author**: Testing Documentation for Competitive Programming


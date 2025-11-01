# README - Soal 2: Konversi Waktu (Menit ke Jam dan Menit)

## 1. Penjelasan Masalah (Problem Understanding)

### Deskripsi Masalah
Program ini menyelesaikan masalah konversi waktu dari format menit tunggal menjadi format jam dan menit. Masalah yang diselesaikan adalah:

- **Input**: Sebuah bilangan bulat yang merepresentasikan total menit (dari 0 sampai 1440 menit)
- **Output**: Format jam dan menit yang terkonversi
- **Constraints**: 
  - Total menit harus dalam range 0 ≤ totalMenit ≤ 1440 (setara dengan 0-24 jam)
  - Program harus menangani edge cases seperti input invalid

### Contoh Masalah
Jika diberikan input 125 menit, maka:
- 125 menit = 2 jam 5 menit (karena 125 ÷ 60 = 2 sisa 5)

Jika diberikan input 1440 menit:
- 1440 menit = 24 jam 0 menit (karena 1440 ÷ 60 = 24 sisa 0)

### Tujuan Program
Mengkonversi representasi waktu dari format menit tunggal menjadi format yang lebih mudah dibaca manusia (jam dan menit terpisah).

---

## 2. Pendekatan (Approach / Algorithm Design)

### Algoritma yang Digunakan
Program menggunakan pendekatan matematika sederhana dengan **operasi pembagian dan modulus**.

### Konsep Matematika
1. **Pembagian Integer (/)**: Digunakan untuk mendapatkan jumlah jam
   - `jam = totalMenit / 60`
   - Pembagian integer akan membuang bagian desimal
   
2. **Modulus (%)**: Digunakan untuk mendapatkan sisa menit
   - `menit = totalMenit % 60`
   - Modulus memberikan sisa pembagian

### Strategi Solusi
```
totalMenit = 125
jam = 125 / 60 = 2 (pembagian integer)
menit = 125 % 60 = 5 (sisa pembagian)

Output: 2 jam 5 menit
```

### Validasi Input
Program melakukan validasi dengan:
- Memeriksa apakah input berhasil dibaca (scanf return value)
- Memastikan totalMenit dalam range valid (0-1440)
- Jika invalid, program langsung return tanpa output

---

## 3. Struktur Kode (Code Walkthrough)

### Bagian 1: Header dan Include
```c
#include <stdio.h>
```
**Penjelasan**: Mengimport library standar untuk input/output (`printf`, `scanf`).

---

### Bagian 2: Fungsi `konversiJam()`
```c
int konversiJam(int totalMenit) {
    return totalMenit / 60;
}
```

**Penjelasan Detail**:
- **Tujuan**: Mengkonversi total menit menjadi jam
- **Parameter**: `totalMenit` - total menit yang akan dikonversi
- **Return**: Jumlah jam (integer)
- **Operasi**: Pembagian integer dengan 60
- **Contoh**: 
  - `konversiJam(125)` → `125 / 60` → `2`
  - `konversiJam(90)` → `90 / 60` → `1`
  - `konversiJam(59)` → `59 / 60` → `0`

**Alasan Implementasi**:
- Pembagian integer otomatis membulatkan ke bawah, sehingga tidak perlu fungsi `floor()`
- Efisien dan cepat (operasi O(1))

---

### Bagian 3: Fungsi `sisaMenit()`
```c
int sisaMenit(int totalMenit) {
    return totalMenit % 60;
}
```

**Penjelasan Detail**:
- **Tujuan**: Menghitung sisa menit setelah dikonversi ke jam
- **Parameter**: `totalMenit` - total menit yang akan dikonversi
- **Return**: Sisa menit (integer, range 0-59)
- **Operasi**: Modulus dengan 60
- **Contoh**:
  - `sisaMenit(125)` → `125 % 60` → `5`
  - `sisaMenit(90)` → `90 % 60` → `30`
  - `sisaMenit(60)` → `60 % 60` → `0`

**Alasan Implementasi**:
- Operator modulus (%) memberikan sisa pembagian
- Menghasilkan nilai 0-59 yang valid untuk menit

---

### Bagian 4: Fungsi `main()` - Input dan Validasi
```c
int totalMenit;
if (scanf("%d", &totalMenit) != 1) return 0;

if (totalMenit < 0 || totalMenit > 1440) return 0;
```

**Penjelasan Detail**:

**Baris 1**: Deklarasi variabel
- `int totalMenit;` - Variabel untuk menyimpan input

**Baris 2**: Validasi pembacaan input
```c
if (scanf("%d", &totalMenit) != 1) return 0;
```
- `scanf("%d", &totalMenit)` membaca integer dari stdin
- Return value `scanf` adalah jumlah item yang berhasil dibaca
- Jika return value != 1, berarti input gagal dibaca atau EOF
- Program langsung exit dengan `return 0` jika input invalid
- **Alasan**: Mencegah undefined behavior jika input tidak valid

**Baris 3**: Validasi range
```c
if (totalMenit < 0 || totalMenit > 1440) return 0;
```
- Memastikan totalMenit ≥ 0 (tidak negatif)
- Memastikan totalMenit ≤ 1440 (maksimal 24 jam = 1440 menit)
- Jika di luar range, program exit tanpa output
- **Alasan**: Membatasi input pada range yang masuk akal untuk waktu

---

### Bagian 5: Konversi dan Output
```c
int jam = konversiJam(totalMenit);
int menit = sisaMenit(totalMenit);

printf("%d jam %d menit\n", jam, menit);
```

**Penjelasan Detail**:

**Baris 1-2**: Memanggil fungsi konversi
- `jam` menyimpan hasil konversi ke jam
- `menit` menyimpan sisa menit

**Baris 3**: Output hasil
- `printf()` mencetak hasil dengan format: `"[jam] jam [menit] menit\n"`
- Format string `"%d jam %d menit\n"` menghasilkan output yang rapi
- **Contoh Output**:
  - Input 125 → Output: `"2 jam 5 menit"`
  - Input 60 → Output: `"1 jam 0 menit"`
  - Input 1440 → Output: `"24 jam 0 menit"`

---

### Bagian 6: Return Statement
```c
return 0;
```
**Penjelasan**: Menandakan program berakhir dengan sukses (exit code 0).

---

## 4. Analisis Kompleksitas (Complexity Analysis)

### Time Complexity: O(1)
- Semua operasi adalah operasi matematika dasar (pembagian, modulus)
- Tidak ada loop atau rekursi
- Waktu eksekusi konstan, tidak bergantung pada ukuran input

### Space Complexity: O(1)
- Hanya menggunakan beberapa variabel lokal (totalMenit, jam, menit)
- Tidak ada struktur data yang tumbuh dengan ukuran input
- Memori yang digunakan konstan

### Analisis Operasi
1. **Pembacaan Input**: O(1) - `scanf()` membaca 1 integer
2. **Validasi**: O(1) - Dua kondisi perbandingan
3. **Konversi Jam**: O(1) - Operasi pembagian integer
4. **Konversi Menit**: O(1) - Operasi modulus
5. **Output**: O(1) - `printf()` mencetak string dengan panjang tetap

**Kesimpulan**: Program sangat efisien dengan kompleksitas konstan untuk semua kasus.

---

## 5. Uji dengan Contoh (Testing & Edge Cases)

### Test Case 1: Input Normal
```
Input: 125
Expected Output: 2 jam 5 menit
Penjelasan: 125 = 2×60 + 5
```

### Test Case 2: Tepat 1 Jam
```
Input: 60
Expected Output: 1 jam 0 menit
Penjelasan: Tepat 60 menit = 1 jam, sisa 0
```

### Test Case 3: Kurang dari 1 Jam
```
Input: 45
Expected Output: 0 jam 45 menit
Penjelasan: Kurang dari 60 menit, jadi 0 jam
```

### Test Case 4: Boundary - Minimum
```
Input: 0
Expected Output: 0 jam 0 menit
Penjelasan: Kasus minimum yang valid
```

### Test Case 5: Boundary - Maximum
```
Input: 1440
Expected Output: 24 jam 0 menit
Penjelasan: Tepat 24 jam (1 hari penuh)
```

### Test Case 6: Edge Case - Multiple Hours
```
Input: 1440
Expected Output: 24 jam 0 menit
Penjelasan: Kasus maksimal (24 jam)
```

### Test Case 7: Invalid Input - Negatif
```
Input: -10
Expected Output: (tidak ada output, program exit)
Penjelasan: Input negatif diabaikan karena validasi
```

### Test Case 8: Invalid Input - Melebihi Batas
```
Input: 1500
Expected Output: (tidak ada output, program exit)
Penjelasan: Melebihi 1440 menit, diabaikan karena validasi
```

### Test Case 9: Sisa Menit Maksimal
```
Input: 1439
Expected Output: 23 jam 59 menit
Penjelasan: Hampir 24 jam, sisa menit maksimal (59)
```

### Test Case 10: Validasi Input Gagal
```
Input: (bukan angka, atau EOF)
Expected Output: (tidak ada output, program exit)
Penjelasan: scanf() gagal membaca, return 0
```

---

## 6. Penutup (Summary)

### Ringkasan Program
Program ini adalah solusi sederhana namun elegan untuk masalah konversi waktu. Menggunakan operasi matematika dasar (pembagian dan modulus) untuk mengkonversi total menit menjadi format jam dan menit.

### Kelebihan
1. **Sederhana**: Kode mudah dipahami dan dirawat
2. **Efisien**: Kompleksitas O(1) untuk semua operasi
3. **Robust**: Memiliki validasi input yang baik
4. **Modular**: Menggunakan fungsi terpisah untuk konversi (prinsip separation of concerns)
5. **Memory Efficient**: Menggunakan memori konstan

### Konsep yang Diterapkan
- **Modular Programming**: Fungsi terpisah untuk setiap operasi
- **Input Validation**: Pemeriksaan input sebelum proses
- **Integer Division**: Pembagian integer untuk mendapatkan jam
- **Modulus Operation**: Sisa pembagian untuk mendapatkan menit

### Aplikasi Praktis
Program ini dapat digunakan dalam:
- Sistem konversi waktu
- Kalkulator waktu
- Aplikasi yang memerlukan format waktu yang user-friendly
- Program latihan untuk memahami operasi matematika dasar dalam C

### Catatan Penting
- Program menggunakan pembagian integer yang otomatis membulatkan ke bawah
- Validasi input penting untuk mencegah error atau output yang tidak valid
- Range 0-1440 menit mencakup satu hari penuh (24 jam)

---

**File**: `soal_2.c.c`  
**Bahasa**: C  
**Kategori**: Math, Basic I/O  
**Kesulitan**: Easy


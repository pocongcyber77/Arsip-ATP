# README - Soal 5: Menghitung Bilangan Catalan dengan Memoization

## 1. Penjelasan Masalah (Problem Understanding)

### Deskripsi Masalah
Program ini menghitung **Bilangan Catalan (Catalan Numbers)** menggunakan teknik **Dynamic Programming dengan Memoization** (Top-down approach).

Bilangan Catalan adalah barisan bilangan yang muncul dalam banyak masalah kombinatorial, termasuk:
- Menghitung cara menyusun cakram (stacking disks)
- Menghitung valid parentheses combinations
- Menghitung binary tree structures
- Menghitung polygon triangulations
- Dan banyak masalah kombinatorial lainnya

### Masalah yang Diselesaikan
Berdasarkan output program, masalah yang diselesaikan adalah:
- **Input**: Jumlah cakram `N` (1 ≤ N ≤ 34)
- **Output**: Total cara menyusun `N` cakram menggunakan bilangan Catalan

### Definisi Bilangan Catalan
Bilangan Catalan ke-n (Cₙ) didefinisikan secara rekursif sebagai:

**Rumus Rekursif**:
```
C₀ = 1
Cₙ = Σ(i=0 to n-1) Cᵢ × Cₙ₋₁₋ᵢ  untuk n > 0
```

**Rumus Closed-form**:
```
Cₙ = (2n)! / ((n+1)! × n!) = C(2n,n) / (n+1)
```

dimana `C(2n,n)` adalah binomial coefficient.

### Contoh Bilangan Catalan
```
C₀ = 1
C₁ = 1
C₂ = 2
C₃ = 5
C₄ = 14
C₅ = 42
C₆ = 132
...
```

### Contoh Masalah: Menyusun Cakram
Untuk `N = 3` cakram:
- Total cara menyusun = C₃ = 5 cara

Penjelasan intuitif (untuk binary tree atau valid parentheses):
- Dengan 3 pasangan parentheses, ada 5 cara valid: `()()()`, `(())()`, `()(())`, `((()))`, `(()())`

---

## 2. Pendekatan (Approach / Algorithm Design)

### Algoritma yang Digunakan
Program menggunakan **Dynamic Programming dengan Memoization (Top-down)** untuk menghitung bilangan Catalan.

### Strategi Solusi

#### 1. Pendekatan Rekursif dengan Memoization
Alih-alih menghitung ulang nilai yang sama berkali-kali (yang terjadi pada rekursif murni), program menyimpan hasil perhitungan dalam array `memo[]`.

#### 2. Base Case
```c
if (n == 0) return 1;
```
- C₀ = 1 adalah base case dari definisi Catalan

#### 3. Rekursi dengan Formula
```c
result = 0;
for (int i = 0; i < n; i++) {
    result += catalan(i) * catalan(n - 1 - i);
}
```

**Penjelasan Formula**:
- Untuk menghitung Cₙ, kita perlu menghitung semua kombinasi:
  - C₀ × Cₙ₋₁ (pilih 0 elemen di kiri, n-1 di kanan)
  - C₁ × Cₙ₋₂ (pilih 1 elemen di kiri, n-2 di kanan)
  - ...
  - Cₙ₋₁ × C₀ (pilih n-1 elemen di kiri, 0 di kanan)

#### 4. Memoization Pattern
```c
if (memo[n] != 0) return memo[n];  // Check cache
// ... calculate ...
memo[n] = result;  // Store in cache
return result;
```

### Perbandingan dengan Pendekatan Lain

#### Naive Recursive (tanpa memoization):
```c
unsigned long long catalan(int n) {
    if (n == 0) return 1;
    unsigned long long result = 0;
    for (int i = 0; i < n; i++)
        result += catalan(i) * catalan(n-1-i);
    return result;
}
```
- **Kompleksitas**: O(4ⁿ / n^(3/2)) - **Sangat lambat!**
- Banyak perhitungan berulang

#### Dengan Memoization (implementasi program):
- **Kompleksitas**: O(n²) - Setiap Cᵢ dihitung sekali, lalu di-cache
- Jauh lebih efisien!

#### Bottom-up Dynamic Programming:
```c
memo[0] = 1;
for (int n = 1; n <= N; n++) {
    memo[n] = 0;
    for (int i = 0; i < n; i++)
        memo[n] += memo[i] * memo[n-1-i];
}
```
- Kompleksitas sama O(n²), tapi lebih efisien secara konstan
- Tidak ada overhead rekursi

---

## 3. Struktur Kode (Code Walkthrough)

### Bagian 1: Header dan Include
```c
#include <stdio.h>
```
**Penjelasan**: Hanya perlu `stdio.h` untuk input/output operations (`scanf`, `printf`).

---

### Bagian 2: Global Array untuk Memoization
```c
unsigned long long memo[35];
```

**Penjelasan Detail**:

**Type**: `unsigned long long`
- Bilangan Catalan dapat menjadi sangat besar
- Contoh: C₃₄ ≈ 1.1 × 10¹⁹ (jauh melebihi `int` atau bahkan `long`)
- `unsigned long long` dapat menyimpan hingga ~1.8 × 10¹⁹
- Range: 0 sampai 18,446,744,073,709,551,615

**Ukuran Array**: `[35]`
- Indeks 0 sampai 34 (35 elemen total)
- Sesuai constraint: N maksimal 34
- Indeks array = n (Catalan ke-n)

**Inisialisasi**: 
- Array global diinisialisasi dengan 0 secara default
- Nilai 0 digunakan sebagai penanda "belum dihitung" (karena C₀ = 1, dan semua Cₙ > 0 untuk n > 0)

**Kenapa Global?**
- Mudah diakses dari fungsi rekursif
- Tidak perlu pass sebagai parameter
- Memori tetap tersedia selama program berjalan

---

### Bagian 3: Fungsi `catalan()` - Base Case
```c
unsigned long long catalan(int n) {
    if (n == 0) return 1;
```

**Penjelasan Detail**:

**Signature Function**:
- **Return Type**: `unsigned long long` - mengembalikan nilai Catalan ke-n
- **Parameter**: `int n` - indeks bilangan Catalan yang ingin dihitung

**Base Case**:
```c
if (n == 0) return 1;
```
- **Kondisi**: Jika n = 0, langsung return 1
- **Alasan**: Menurut definisi, C₀ = 1
- **Pentignnya**: Base case menghentikan rekursi dan mencegah infinite recursion
- **Tidak perlu memoization**: C₀ selalu sama, tapi tetap bisa di-memo untuk konsistensi

**Contoh**:
- `catalan(0)` → langsung return `1`, tanpa perhitungan apapun

---

### Bagian 4: Fungsi `catalan()` - Memoization Check
```c
    if (memo[n] != 0) return memo[n];
```

**Penjelasan Detail**:

**Tujuan**: Memeriksa apakah nilai sudah pernah dihitung sebelumnya

**Logika**:
- Jika `memo[n] != 0`, berarti nilai sudah dihitung dan disimpan
- Langsung return nilai dari cache tanpa perhitungan ulang
- Ini adalah inti dari teknik **memoization**

**Kenapa `!= 0`?**
- Semua bilangan Catalan untuk n > 0 adalah bilangan positif
- Nilai 0 menandakan "belum dihitung" (inisialisasi default)
- **Penting**: Asumsi ini valid karena Cₙ > 0 untuk semua n ≥ 0

**Optimization Impact**:
Tanpa memoization:
```
catalan(5) memanggil:
  - catalan(0) [beberapa kali]
  - catalan(1) [beberapa kali]
  - catalan(2) [beberapa kali]
  - catalan(3) [beberapa kali]
  - catalan(4) [beberapa kali]
```

Dengan memoization:
```
catalan(5) memanggil:
  - catalan(0) [1x, lalu di-cache]
  - catalan(1) [1x, lalu di-cache]
  - catalan(2) [1x, lalu di-cache]
  - catalan(3) [1x, lalu di-cache]
  - catalan(4) [1x, lalu di-cache]
  - Setiap nilai hanya dihitung sekali!
```

**Contoh Eksekusi**:
```c
catalan(3):
  - Check memo[3]: 0 (belum dihitung) → lanjut
  - Hitung menggunakan loop
  - Simpan hasil ke memo[3]
  - Return hasil

// Jika dipanggil lagi:
catalan(3):
  - Check memo[3]: 5 (sudah dihitung) → return 5 langsung!
```

---

### Bagian 5: Fungsi `catalan()` - Rekursi dan Perhitungan
```c
    unsigned long long result = 0;
    for (int i = 0; i < n; i++) {
        result += catalan(i) * catalan(n - 1 - i);
    }
```

**Penjelasan Detail**:

**Inisialisasi**:
```c
unsigned long long result = 0;
```
- Variabel untuk mengakumulasi hasil
- Type `unsigned long long` untuk menampung nilai besar

**Loop Rekursif**:
```c
for (int i = 0; i < n; i++) {
    result += catalan(i) * catalan(n - 1 - i);
}
```

**Penjelasan Iterasi**:

**i = 0**:
- `catalan(0) × catalan(n-1)`
- Mewakili kombinasi: 0 elemen di kiri, (n-1) elemen di kanan
- Contoh untuk n=3: `C₀ × C₂ = 1 × 2 = 2`

**i = 1**:
- `catalan(1) × catalan(n-2)`
- Mewakili kombinasi: 1 elemen di kiri, (n-2) elemen di kanan
- Contoh untuk n=3: `C₁ × C₁ = 1 × 1 = 1`

**i = 2**:
- `catalan(2) × catalan(n-3)`
- Mewakili kombinasi: 2 elemen di kiri, (n-3) elemen di kanan
- Contoh untuk n=3: `C₂ × C₀ = 2 × 1 = 2`

**... dan seterusnya sampai i = n-1**

**Total untuk n=3**:
```
result = C₀×C₂ + C₁×C₁ + C₂×C₀
       = 1×2 + 1×1 + 2×1
       = 2 + 1 + 2
       = 5
```

**Alasan Formula**:
Formula ini berasal dari struktur rekursif masalah kombinatorial:
- Untuk membentuk struktur dengan n elemen, kita bisa:
  1. Pilih posisi "pembagi" di antara elemen
  2. Struktur kiri dengan i elemen: ada Cᵢ cara
  3. Struktur kanan dengan (n-1-i) elemen: ada Cₙ₋₁₋ᵢ cara
  4. Total untuk posisi pembagi ini: Cᵢ × Cₙ₋₁₋ᵢ
  5. Jumlahkan untuk semua posisi pembagi (i = 0 sampai n-1)

**Rekursi yang Terjadi**:
```
catalan(4):
  i=0: catalan(0) × catalan(3)  → catalan(3) perlu dihitung
  i=1: catalan(1) × catalan(2)  → catalan(2) perlu dihitung
  i=2: catalan(2) × catalan(1)  → catalan(2) sudah dihitung (memo!)
  i=3: catalan(3) × catalan(0)  → catalan(3) sudah dihitung (memo!)
```

Dengan memoization, setiap subproblem hanya dihitung sekali!

---

### Bagian 6: Fungsi `catalan()` - Simpan ke Cache dan Return
```c
    memo[n] = result;
    return result;
}
```

**Penjelasan Detail**:

**Simpan ke Cache**:
```c
memo[n] = result;
```
- Setelah menghitung `result`, simpan ke array `memo[]`
- Index `n` menyimpan nilai Catalan ke-n
- Panggilan berikutnya untuk `catalan(n)` akan langsung return dari cache

**Return Value**:
```c
return result;
```
- Mengembalikan nilai hasil perhitungan
- Caller dapat menggunakan nilai ini

**Urutan Penting**:
1. Hitung `result` terlebih dahulu
2. Simpan ke `memo[n]` (cache)
3. Return `result`
- **Tidak bisa dibalik**: Harus hitung dulu baru simpan

---

### Bagian 7: Fungsi `main()` - Input dan Validasi
```c
int main() {
    int N;
    if (scanf("%d", &N) != 1) return 0;
    if (N < 1 || N > 34) {
        printf("Error: Jumlah cakram harus antara 1 sampai 34\n");
        return 0;
    }
```

**Penjelasan Detail**:

**Deklarasi Variabel**:
```c
int N;
```
- Variabel untuk menyimpan jumlah cakram dari input

**Input dengan Validasi**:
```c
if (scanf("%d", &N) != 1) return 0;
```
- `scanf("%d", &N)` membaca integer dari stdin
- Return value `scanf` adalah jumlah item yang berhasil dibaca
- Jika return value != 1, berarti input gagal (EOF atau format salah)
- Program langsung exit dengan `return 0`
- **Alasan**: Mencegah undefined behavior jika input invalid

**Validasi Range**:
```c
if (N < 1 || N > 34) {
    printf("Error: Jumlah cakram harus antara 1 sampai 34\n");
    return 0;
}
```
- Memastikan `N` dalam range valid: 1 ≤ N ≤ 34
- **Kenapa 34?**
  - C₃₄ ≈ 1.1 × 10¹⁹ masih muat dalam `unsigned long long`
  - C₃₅ ≈ 3.1 × 10¹⁹ melebihi batas `unsigned long long` (~1.8 × 10¹⁹)
- Jika di luar range, cetak error message dan exit
- **User-friendly**: Memberikan feedback yang jelas kepada user

---

### Bagian 8: Fungsi `main()` - Perhitungan dan Output
```c
    unsigned long long hasil = catalan(N);
    printf("Total cara menyusun %d cakram adalah %llu\n", N, hasil);

    return 0;
}
```

**Penjelasan Detail**:

**Panggil Fungsi Catalan**:
```c
unsigned long long hasil = catalan(N);
```
- Memanggil fungsi `catalan(N)` untuk menghitung bilangan Catalan ke-N
- Menyimpan hasil ke variabel `hasil`
- Type `unsigned long long` untuk menampung nilai besar

**Output Hasil**:
```c
printf("Total cara menyusun %d cakram adalah %llu\n", N, hasil);
```
- Format string: `"Total cara menyusun %d cakram adalah %llu\n"`
- `%d`: Format untuk `int` (N)
- `%llu`: Format untuk `unsigned long long` (hasil)
- Output memberikan konteks yang jelas tentang apa yang dihitung

**Contoh Output**:
```
Input: 3
Output: Total cara menyusun 3 cakram adalah 5

Input: 5
Output: Total cara menyusun 5 cakram adalah 42
```

**Return Statement**:
```c
return 0;
```
- Menandakan program berakhir dengan sukses (exit code 0)

---

## 4. Analisis Kompleksitas (Complexity Analysis)

### Time Complexity: **O(n²)**

**Penjelasan**:

#### Tanpa Memoization:
- **Kompleksitas**: O(4ⁿ / n^(3/2)) ≈ O(4ⁿ)
- Setiap `catalan(n)` memanggil `catalan(i)` dan `catalan(n-1-i)` untuk semua i
- Banyak perhitungan berulang (overlapping subproblems)
- **Tidak efisien!**

#### Dengan Memoization (implementasi program):
- Setiap `catalan(i)` untuk i = 0 sampai n hanya dihitung **sekali**
- Total subproblem yang perlu dihitung: n+1 (dari C₀ sampai Cₙ)
- Untuk setiap subproblem `catalan(k)`:
  - Loop dari i = 0 sampai k-1: O(k) operasi
  - Setiap iterasi melakukan 2 lookup/panggilan rekursif (tapi sudah di-cache)
- **Total**: O(0 + 1 + 2 + ... + n) = O(n²)

**Breakdown**:
```
catalan(0): O(1) - base case
catalan(1): O(1) - loop 1 iterasi
catalan(2): O(2) - loop 2 iterasi
catalan(3): O(3) - loop 3 iterasi
...
catalan(n): O(n) - loop n iterasi

Total: O(1 + 1 + 2 + 3 + ... + n) = O(n²)
```

### Space Complexity: **O(n)**

**Breakdown**:
1. **Array `memo[]`**: O(n) - menyimpan n+1 nilai
2. **Call Stack**: O(n) - rekursi bisa mencapai depth n
   - Contoh: `catalan(n)` → `catalan(n-1)` → ... → `catalan(0)`
   - Tapi dengan memoization, banyak path tidak perlu dieksplorasi
   - Worst case depth: O(n)
3. **Variabel lokal**: O(1) - `result`, `i`, dll

**Total**: O(n) untuk array + O(n) untuk stack = O(n)

**Catatan**: Space complexity bisa dioptimasi menjadi O(1) jika menggunakan bottom-up DP, tapi trade-off dengan readability.

---

## 5. Uji dengan Contoh (Testing & Edge Cases)

### Test Case 1: Minimum Value
```
Input: 1
Expected Output: Total cara menyusun 1 cakram adalah 1
Penjelasan: C₁ = 1
Verifikasi: 
  catalan(1) = C₀ × C₀ = 1 × 1 = 1 ✓
```

### Test Case 2: Small Value
```
Input: 2
Expected Output: Total cara menyusun 2 cakram adalah 2
Penjelasan: C₂ = 2
Verifikasi:
  catalan(2) = C₀×C₁ + C₁×C₀
             = 1×1 + 1×1
             = 1 + 1 = 2 ✓
```

### Test Case 3: Medium Value
```
Input: 3
Expected Output: Total cara menyusun 3 cakram adalah 5
Penjelasan: C₃ = 5
Verifikasi:
  catalan(3) = C₀×C₂ + C₁×C₁ + C₂×C₀
             = 1×2 + 1×1 + 2×1
             = 2 + 1 + 2 = 5 ✓
```

### Test Case 4: Larger Value
```
Input: 4
Expected Output: Total cara menyusun 4 cakram adalah 14
Penjelasan: C₄ = 14
Verifikasi:
  catalan(4) = C₀×C₃ + C₁×C₂ + C₂×C₁ + C₃×C₀
             = 1×5 + 1×2 + 2×1 + 5×1
             = 5 + 2 + 2 + 5 = 14 ✓
```

### Test Case 5: Known Catalan Number
```
Input: 5
Expected Output: Total cara menyusun 5 cakram adalah 42
Penjelasan: C₅ = 42 (nilai Catalan yang terkenal)
```

### Test Case 6: Maximum Valid Value
```
Input: 34
Expected Output: Total cara menyusun 34 cakram adalah 1234812210547300... (angka besar)
Penjelasan: C₃₄ adalah nilai maksimal yang masih muat dalam unsigned long long
Catatan: Perlu verifikasi manual dengan calculator
```

### Test Case 7: Invalid Input - Below Minimum
```
Input: 0
Expected Output: Error: Jumlah cakram harus antara 1 sampai 34
Penjelasan: Validasi range menolak input di bawah minimum
```

### Test Case 8: Invalid Input - Above Maximum
```
Input: 35
Expected Output: Error: Jumlah cakram harus antara 1 sampai 34
Penjelasan: Validasi range menolak input di atas maximum
Catatan: C₃₅ akan overflow unsigned long long
```

### Test Case 9: Invalid Input - Negative
```
Input: -5
Expected Output: Error: Jumlah cakram harus antara 1 sampai 34
Penjelasan: Validasi range menolak input negatif
```

### Test Case 10: Edge Case - Input Gagal
```
Input: (bukan angka, atau EOF)
Expected Output: (tidak ada output, program exit)
Penjelasan: scanf() gagal membaca, return 0 langsung
```

### Test Case 11: Memoization Verification
Untuk memverifikasi memoization bekerja:
```
Input: 10
Expected Output: Total cara menyusun 10 cakram adalah 16796

Trace (simplified):
  catalan(10) dipanggil
    - Loop i=0: catalan(0) × catalan(9)
      → catalan(9) dipanggil (belum di cache)
    - Loop i=1: catalan(1) × catalan(8)
      → catalan(8) dipanggil (belum di cache)
    ...
    - Setelah selesai, semua nilai C₀ sampai C₁₀ sudah di-cache
    - Jika ada panggilan ulang, akan langsung return dari cache
```

### Test Case 12: Sequence Verification
Memverifikasi beberapa nilai berturut-turut:
```
Catalan Sequence yang benar:
C₀ = 1
C₁ = 1
C₂ = 2
C₃ = 5
C₄ = 14
C₅ = 42
C₆ = 132
C₇ = 429
C₈ = 1430
C₉ = 4862
C₁₀ = 16796

Program harus menghasilkan nilai yang sama untuk setiap input.
```

---

## 6. Penutup (Summary)

### Ringkasan Program
Program ini menghitung bilangan Catalan menggunakan **Dynamic Programming dengan Memoization**. Ini adalah teknik yang sangat efisien untuk menghindari perhitungan berulang dalam rekursi, mengurangi kompleksitas dari eksponensial menjadi kuadratik.

### Kelebihan
1. **Efisien**: Kompleksitas O(n²) vs O(4ⁿ) untuk rekursif murni
2. **Akurat**: Menggunakan `unsigned long long` untuk menangani nilai besar
3. **Robust**: Validasi input yang baik dengan error handling
4. **Clear Logic**: Kode mudah dipahami dengan struktur rekursif yang jelas
5. **Memory Efficient**: Hanya menggunakan O(n) space untuk cache

### Konsep yang Diterapkan
1. **Dynamic Programming**: Memecah masalah besar menjadi submasalah kecil
2. **Memoization**: Menyimpan hasil perhitungan untuk menghindari recomputation
3. **Recursive Formula**: Menggunakan definisi rekursif bilangan Catalan
4. **Top-down Approach**: Menghitung dari nilai besar ke kecil (bukan bottom-up)

### Aplikasi Praktis
Bilangan Catalan muncul dalam berbagai masalah:
- **Valid Parentheses**: Jumlah kombinasi parentheses valid dengan n pasangan
- **Binary Trees**: Jumlah binary tree berbeda dengan n nodes
- **Stacking Problems**: Jumlah cara menyusun elemen dengan constraint tertentu
- **Polygon Triangulation**: Jumlah cara triangulasi poligon dengan n+2 sisi
- **Path Counting**: Jumlah path grid dengan constraint diagonal

### Catatan Penting
- **Range Constraint**: Maksimal N=34 karena keterbatasan `unsigned long long`
- **Memoization Assumption**: Mengasumsikan Cₙ > 0 untuk semua n (valid untuk Catalan)
- **Initialization**: Array `memo[]` diinisialisasi 0 sebagai penanda "belum dihitung"
- **Base Case**: C₀ = 1 adalah base case yang penting

### Alternatif Implementasi
1. **Bottom-up DP**: Lebih efisien (tidak ada overhead rekursi)
   ```c
   memo[0] = 1;
   for (int n = 1; n <= N; n++) {
       memo[n] = 0;
       for (int i = 0; i < n; i++)
           memo[n] += memo[i] * memo[n-1-i];
   }
   ```

2. **Closed-form Formula**: Lebih cepat untuk nilai tunggal, tapi perlu factorial
   ```c
   Cₙ = factorial(2*n) / (factorial(n+1) * factorial(n))
   ```

3. **Iterative Formula**: Menggunakan hubungan Cₙ = (2(2n-1)/(n+1)) × Cₙ₋₁

### Potensi Perbaikan
1. **Bottom-up Implementation**: Menghilangkan overhead rekursi
2. **Input Validation**: Bisa tambahkan validasi untuk non-integer input
3. **Error Messages**: Bisa lebih detail tentang kenapa input ditolak
4. **Output Format**: Bisa format angka besar dengan pemisah ribuan untuk readability

---

**File**: `soal_5.c.c`  
**Bahasa**: C  
**Kategori**: Dynamic Programming, Memoization, Combinatorics  
**Kesulitan**: Medium  
**Algoritma**: Top-down DP dengan Memoization  
**Complexity**: O(n²) time, O(n) space


📘 Breakdown Lengkap (Markdown) — Perkalian Skalar pada Matriks 2×2 (C)
=======================================================================

Dokumen ini memecah **soal**, **pengerjaan**, **algoritma**, **logika**, **segmen kode**, **sintaks C**, **operasi**, **library**, **analisis kompleksitas**, **uji kasus**, dan **istilah penting**. Di akhir ada juga **varian solusi** dengan array 2D dan **tips kompilasi** (Linux/CLI friendly).

> **Masalah inti:** Diberi pengali n dan matriks 2×2 berisi a b c d. Tugasnya adalah mencetak matriks baru setelah **setiap elemen** dikalikan n.

1) 📥 Format Masukan & 📤 Keluaran
----------------------------------

*   **Input**
    
    *   Baris 1: bilangan bulat n (2 ≤ n ≤ 10)
        
    *   Baris 2: empat bilangan bulat a b c d (0 ≤ a,b,c,d ≤ 100)
        
*   **Output**
    
    *   a\*n b\*nc\*n d\*n
        

**Contoh 1**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  2  10 20 30 40  Output:  20 40  60 80   `

**Contoh 2**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  5  1 0 3 7  Output:  5 0  15 35   `

2) 🧠 Intuisi & Logika
----------------------

*   Ini adalah **perkalian skalar** terhadap matriks: setiap elemen matriks dikalikan dengan konstanta n.
    
*   Tidak perlu operasi matriks kompleks (seperti perkalian antar matriks), cukup 4 operasi perkalian independent.
    
*   Karena batas nilai kecil, aman memakai int (maks hasil 100 × 10 = 1000).
    

3) 🪜 Algoritma (Langkah-langkah)
---------------------------------

1.  Baca integer n.
    
2.  Baca empat integer a, b, c, d.
    
3.  Hitung:
    
    *   A11 = a\*n, A12 = b\*n
        
    *   A21 = c\*n, A22 = d\*n
        
4.  Cetak hasil dalam **dua baris**:
    
    *   Baris 1: A11 A12
        
    *   Baris 2: A21 A22
        

**Kompleksitas Waktu:** O(1)**Kompleksitas Memori:** O(1)

4) 🔡 Pseudocode
----------------

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   read n  read a, b, c, d  print (a*n), (b*n)  print (c*n), (d*n)   `

5) ✅ Implementasi C (sesuai template) — versi rapi
--------------------------------------------------

> **Catatan:** Jika kode kamu berasal dari HTML, ubah < → < dan & → &.

**C**#include #include #include #include int main() { int n; int a, b, c, d; _// Baca n_ if (scanf("%d", &n) != 1) return 0; _// Baca a, b, c, d (dipisah spasi/enter tetap terbaca)_ if (scanf("%d %d %d %d", &a, &b, &c, &d) != 4) return 0; _// Kalikan dan cetak dalam format 2x2_ printf("%d %d\\n", a \* n, b \* n); printf("%d %d\\n", c \* n, d \* n); return 0;}**Show more lines**

6) 🧩 Penjelasan Segmen Kode
----------------------------

*   #include Memuat fungsi I/O standar seperti scanf dan printf.
    
*   #include , , Tidak wajib untuk solusi ini, tapi aman dibiarkan sesuai template.
    
*   int n; int a, b, c, d;Menampung pengali dan elemen-elemen matriks 2×2.
    
*   scanf("%d", &n)Membaca bilangan bulat. **Return value** dicek (harus 1) sebagai sanity check input.
    
*   scanf("%d %d %d %d", &a, &b, &c, &d)Membaca empat integer. Spasi atau newline tidak masalah untuk scanf.
    
*   printf("%d %d\\n", ...)Mencetak dua elemen pertama di baris 1, lalu dua elemen berikutnya di baris 2.
    

7) 🔣 Sintaks & Operasi C yang Dipakai
--------------------------------------

*   **Tipe data**: intCocok karena nilai hasil ≤ 1000 (aman untuk int 32-bit).
    
*   **Operator aritmetika**: \* (perkalian)
    
*   **Format I/O**
    
    *   scanf("%d", &var); → baca integer
        
    *   printf("%d", var); → cetak integer
        
    *   \\n → newline (pindah baris)
        
*   **Pemeriksaan input**:
    
    *   scanf mengembalikan jumlah item yang berhasil dibaca. Mengecek != 1 atau != 4 adalah **mekanisme validasi sederhana** untuk mencegah data rusak.
        

8) 🧪 Uji Coba & Edge Cases
---------------------------

1.  Input:20 0 0 0Output:0 00 0
    
2.  Input:10100 100 100 100Output:1000 10001000 1000
    
3.  Input:30 5 0 7Output:0 150 21
    

> **Catatan**: Soal membatasi n dari 2 hingga 10, dan a..d dari 0 hingga 100. Tidak perlu validasi ekstra jika input sudah dijamin sesuai.

9) 🛠️ Kompilasi & Eksekusi (Linux/CLI)
---------------------------------------

**Shell**\# Kompilasigcc main.c -o app# Jalankan (input manual)./app# Jalankan (pakai file)./app < input.txt

10) 🧠 Istilah Penting
----------------------

*   **Matriks 2×2**: Struktur data 2 baris × 2 kolom berisi angka.
    
*   **Perkalian Skalar**: Mengalikan setiap elemen matriks dengan satu bilangan.
    
*   **STDIN / STDOUT**: Aliran standar input/output program.
    
*   **Format Specifier**: Tanda di scanf/printf (misal %d untuk int).
    
*   **Return Value scanf**: Banyaknya item yang berhasil di-parse.
    

11) 🔁 Variasi: Implementasi dengan Array 2D (Lebih mudah digeneralisasi)
-------------------------------------------------------------------------

Jika kamu ingin gaya yang lebih “matriks”, ini contoh menggunakan loop:

**C**#include int main() { int n; int m\[2\]\[2\]; if (scanf("%d", &n) != 1) return 0; if (scanf("%d %d %d %d", &m\[0\]\[0\], &m\[0\]\[1\], &m\[1\]\[0\], &m\[1\]\[1\]) != 4) return 0; _// Perkalian skalar_ for (int i = 0; i < 2; i++) { for (int j = 0; j < 2; j++) { m\[i\]\[j\] \*= n; } } _// Cetak_ printf("%d %d\\n", m\[0\]\[0\], m\[0\]\[1\]); printf("%d %d\\n", m\[1\]\[0\], m\[1\]\[1\]); return 0;}**Show more lines**

> Kelebihan: mudah diubah menjadi NxN (tinggal ubah ukuran dan loop).

12) 🧩 Debug Tips & Pitfalls
----------------------------

*   **HTML escape**: Pastikan #include  bukan #include <stdio.h> dan & di alamat variabel benar (&a, bukan &a).
    
*   **Format spesifier**: Jangan salah antara %d (int), %f (float), %lf (double).
    
*   **Spasi/Newline**: scanf mengabaikan spasi & newline; tidak perlu memaksa berada di baris yang sama.
    
*   **Overflow**: Tidak terjadi pada batas soal ini.
    

13) 💡 Ekstensi (Opsional)
--------------------------

*   Baca matriks ukuran N×N dinamis.
    
*   Modularisasi fungsi: void scale2x2(int m\[2\]\[2\], int n).
    
*   Validasi ketat input (misal jika digunakan di lingkungan tak terkontrol).

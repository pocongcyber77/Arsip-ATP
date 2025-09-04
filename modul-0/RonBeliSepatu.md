📘 Markdown Sederhana & Lengkap — Bit Shift “A Little to the Left” (C)
======================================================================

Dokumen ini memecah **soal**, **algoritma**, **pseudocode**, **kode C (siap submit)**, **penjelasan segmen kode**, **uji coba**, **edge cases**, **kompleksitas**, **tips kompilasi**, dan **istilah penting**. Tujuannya biar **lolos semua test case** dengan output persis sesuai format.

1) 📝 Deskripsi Singkat Soal
----------------------------

Diberi sebuah bilangan bulat N. Kamu diminta:

*   Menggeser bit N **dua kali ke kiri** (<< dua kali),
    
*   Lalu hasilnya **tiga kali ke kanan** (>> tiga kali),
    
*   Cetak hasil akhir di **baris pertama**,
    
*   Cetak string **EZBANGET** di **baris kedua**.
    

> Intinya menghitung: result = (N << 2) >> 3.

2) 📥 Input, 📤 Output, dan Batasan
-----------------------------------

**Input**

*   Satu bilangan bulat N
    

**Constraints**

*   1 ≤ N ≤ 10^9
    

**Output**

*   Baris 1: hasil pergeseran bit
    
*   Baris 2: EZBANGET
    

**Contoh 1**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  7  Output:  3  EZBANGET   `

**Contoh 2**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  16  Output:  8  EZBANGET   `

3) 💡 Intuisi & Catatan Penting
-------------------------------

*   << 2 artinya geser kiri 2 bit ⇒ **kali 4**
    
*   \>> 3 artinya geser kanan 3 bit ⇒ **bagi 8** (untuk bilangan non-negatif)
    
*   **Namun:** kita tetap implement **sesuai instruksi** (geser kiri 2x lalu kanan 3x), bukan langsung N >> 1.
    
*   **Kenapa pakai long long?**N bisa 10^9; N << 2 = 4×10^9, ini **melebihi** range int signed 32-bit (≈2.1×10^9).Men-shift int ke nilai yang overflow itu **Undefined Behavior** di C.Dengan long long, 4×10^9 aman (jauh di bawah 9×10^18).
    

4) 🪜 Algoritma (Langkah-Langkah)
---------------------------------

1.  Baca N (tipe long long).
    
2.  Hitung result = (N << 2) >> 3.
    
3.  Cetak result.
    
4.  Cetak EZBANGET (tepat sama, huruf besar semua).
    

**Kompleksitas Waktu**: O(1)**Kompleksitas Memori**: O(1)

5) 🔣 Pseudocode
----------------

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   read N  result = (N << 2) >> 3  print result  print "EZBANGET"   `

6) ✅ Implementasi C (Siap Submit)
---------------------------------

> **Catatan:** Jika kamu menyalin dari HTML, pastikan mengganti < → < dan & → &.

**C**#include #include #include #include int main() { long long N; if (scanf("%lld", &N) != 1) return 0; _// Geser dua kali ke kiri, lalu tiga kali ke kanan (sesuai instruksi)_ long long result = (N << 2) >> 3; printf("%lld\\n", result); printf("EZBANGET\\n"); return 0;}**Show less**

7) 🧩 Penjelasan Segmen Kode
----------------------------

*   long long N;Memastikan N << 2 tidak overflow tipe signed 32-bit.
    
*   scanf("%lld", &N)Membaca long long. scanf mengembalikan jumlah item terbaca (dicek untuk keamanan).
    
*   long long result = (N << 2) >> 3;Implementasi literal dari instruksi: kiri 2x, kanan 3x.
    
*   printf("%lld\\n", result);Mencetak hasil dan newline.
    
*   printf("EZBANGET\\n");Cetak string persis (huruf besar semua).
    

8) 🧪 Uji Coba (Sesuai Sampel)
------------------------------

**Uji 1**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  7  Output:  3  EZBANGET   `

**Uji 2**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  16  Output:  8  EZBANGET   `

**Uji Tambahan**

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  1  Proses: (1<<2)=4, 4>>3=0  Output:  0  EZBANGET   `

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   Input:  1000000000  Proses: 1e9<<2 = 4e9 (aman di long long), lalu >>3 = 500000000  Output:  500000000  EZBANGET   `

9) Edge Cases & Pitfalls
------------------------

*   **N kecil** (misal 1): hasil bisa jadi 0 karena shift kanan 3 kali.
    
*   **Range besar**: tanpa long long, N<<2 bisa overflow (UB). Gunakan long long.
    
*   **Whitespace input**: scanf mengabaikan spasi/newline—aman untuk input satu angka.
    
*   **Output persis**: hindari spasi ekstra, pastikan ada newline setelah baris pertama dan kedua.
    

10) 🧠 Istilah Penting
----------------------

*   **Bitwise shift**: Operasi geser bit (<<, >>).
    
*   **Arithmetic right shift**: Pada tipe signed positif sama dengan pembagian 2 berbasis bit (isi bit tanda ‘0’). Aman karena N ≥ 1.
    
*   **Undefined Behavior (UB)**: Perilaku tidak terdefinisi—misalnya overflow shift pada signed int.
    

11) 🛠️ Kompilasi & Eksekusi (CLI)
----------------------------------

**Linux / macOS**

**Shell**gcc main.c -O2 -std=c11 -Wall -Wextra -o app./app

**Windows (MinGW)**

**BAT**gcc main.c -O2 -std=c11 -Wall -Wextra -o app.exeapp.exe

**Dengan file input**

**Shell**./app < input.txt

12) Bonus Insight (Tidak Wajib Diimplementasi)
----------------------------------------------

Secara nilai (untuk N ≥ 0), (N << 2) >> 3 **setara** N >> 1.Tapi untuk menuruti **instruksi soal** (2 kali kiri, 3 kali kanan), kita **tetap menulis** (N << 2) >> 3.

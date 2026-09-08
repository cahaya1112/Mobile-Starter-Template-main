# Laporan Praktikum Modul 02: Declarative UI & Responsive Layout

- **Nama**: Cahaya Wulandari
- **NIM**: 362558302038
- **Kelas / Prodi**: 3C / Sarjana Terapan TRPL
- **Mata Kuliah**: Pemrograman Perangkat Bergerak (Semester 3)

---

## 1. Ringkasan Implementasi
Pada praktikum kali ini saya menggunakan LayoutBuilder agar tampilan dashboard saya bisa menyesuaikan layar device yang digunakan. Saat membuka di handphone dengan layar dibawah 600db, tampilannya akan otomatis menjadi 1 kolom ke bawah pakai ListView. Tapi saat dibuka di tablet(landscape) yang ukurannya 600dp ke atas, tampilannya langsung berubah jadi 2 kolom sebelah sebelahan (menggunakan row). Bagian kiri menampilkan Header Banner, peringatan SKS, dan filter, Bagian kanan menampilkan daftar mata kuliah(menggunakan GridView). Dan jugaa saya menambahkan fitur dark mode dan light mode(standar material 3).

## 2. Bukti Tangkapan Layar (Running App)
| Mode Portrait (Light) | Mode Dark Theme | Mode Landscape / Tablet (2 Kolom) |
|---|---|---|
| ![Portrait](./screenshots/Screenshot%202026-09-08%20180454.png) | ![Dark](./screenshots/Screenshot%202026-09-08%20180441.png) | ![Wide](./screenshots/Screenshot%202026-09-08%20181229.png) |

## 3. Kendala Layout yang Dihadapi & Solusinya
- **Kendala**: 1. Saya bingung memahami maksud dari intruksi "mode tablet/ landscape responsif 2 kolom", bingung bagaimana bentuk visual yang diinstruksikan.
                2. Adanya error yang diakibatkan typo disaat mengimplementasikan fungsi peringatan limit 24 SKS
- **Solusi**: 1. bertanya ke teman yang sudah selesai, lalu melakukan pembagian 2 kolom di tablet  dan membeddakan struktur 1 kolom vertikal di hp
                2. Mengoreksi penulisan kode, dan melakukan pembetulan pada kode yang salah
## 4. Jawaban Pertanyaan Refleksi
1. **Efisiensi Single-pass BoxConstraints**: Aturan ini membuat rendering di Flutter menjadi sangat cepat karena proses komputasinya hanya dilakukan satu kali dari atas ke bawah tanpa perlu perhitungan berulang-ulang. Komunikasi antar-widget juga berjalan searah, di mana widget induk memberikan batas ukuran ke widget anak, lalu widget anak menentukan ukurannya sendiri berdasarkan batas yang sudah diberikan oleh widget induk. Setelah itu, ukurannya dilaporkan kembali ke induknya dan akhirnya widget induk yang menentukan posisi pas untuk menaruh widget anak di layar. Karena setiap elemen widget hanya dikunjungi sekali dalam satu putaran komputasi, prosesnya jadi sangat efisien dengan kompleksitas $O(N)$ sehingga aplikasi terasa ringan saat dijalankan.
2. **Kriteria Modularisasi Widget**: Kriteria widget itu sebaiknya dipecah ke file yang terpisah seperti course card. Jadi, jika ada komponen yang sifatnya reusable atau sering dipakai ulang di layar lain dan juga memiliki struktur kode yang panjang agar file utama itu tidak berantakan. Tapi sebaliknya, komponen cukup dijadikan sebagai private widget di file yang sama seperti build category filter. Karena widget tersebut fungsinya kan sangat spesifik dan hanya dipakai khusus di layar itu saja. Itu jawabanku untuk nomor dua.
3. **Manfaat M3 ThemeData Terpusat**: Karena kita tidak perlu repot-repot untuk memberi warna secara manual pada setiap widget di file yang terpisah dan menentukan skema warna utama seperti colorscheme.fromseed di tempat terpusat. Dan juga seluruh komponen aplikasi seperti app bar, card, hingga ListTile itu bisa menyesuaikan secara otomatis untuk warna yang konsisten, termasuk saat berpindah dari mode terang ke mode gelap seperti yang ada pada tantangan.
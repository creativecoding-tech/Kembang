# Kembang 🌸

__Kembang__ adalah sebuah project seni generatif (_generative art_) interaktif yang dibangun menggunakan __Processing__.

📺 __Demo__: [Tonton di YouTube](https://youtu.be/DtnN-K0MIWk)

Project ini memvisualisasikan transformasi grid struktur menjadi pola Phyllotaxis spiral menggunakan kurva Bézier yang "membunga" di layar. Node-node grid secara organis bergerak dan bertransformasi mengikuti pola spiral Golden Angle (137.5°), menciptakan visualisasi yang memadukan struktur matematika dengan estetika organik.

## 🎮 Fitur Utama

- __Grid Phyllotaxis__: Transformasi dari grid teratur menjadi pola spiral berdasarkan Golden Angle (137.5°)
- __Animasi Node__: Setiap intersection point grid bergerak secara independen menuju posisi Phyllotaxis target
- __Kurva Bézier Ganda__: Sistem kurva vertikal dan horizontal yang menghubungkan node-node yang sedang beranimasi
- __Efek Jejak (Trails)__: Menggunakan teknik penumpukan layer semi-transparan (alpha trail) untuk menciptakan efek jejak gerakan yang halus dan artistik
- __Validasi Batas__: Node yang keluar dari layar akan di-nonaktifkan secara otomatis untuk performa optimal
- __Full Screen Mode__: Visualisasi ditampilkan dalam mode layar penuh untuk pengalaman imersif.

## 🎮 Kontrol (Controls)

Anda dapat berinteraksi dengan visualisasi menggunakan input berikut:

| Input | Aksi |
| --- | --- |
| __Klik Mouse__ | Memulai animasi transformasi grid ke Phyllotaxis |

Animasi dimulai dalam keadaan grid statis. Klik mouse untuk memulai animasi transformasi.

## 🚀 Cara Menjalankan

1. Pastikan Anda sudah menginstal Processing IDE.
2. Clone atau download repositori ini.
3. Buka file `Kembang.pde`.
4. Tekan tombol __Run__ (Play) atau tekan `Ctrl+R` (Windows/Linux) / `Cmd+R` (Mac).

## 🎨 Teknis

Project ini menggunakan:
- **Processing 3+** dengan renderer `@2D` untuk performa optimal
- **Node class** untuk mengelola setiap intersection point secara independen
- **Algoritma Phyllotaxis**: Menggunakan Golden Angle (137.5°) dan rumus `radius = cellSize * 0.3 * sqrt(index)`
- **Kurva Bézier dengan Control Point**: Kurva vertikal dan horizontal dengan offset control point untuk efek melengkung
- **Alpha blending** untuk efek trails yang halus
- **Sistem Validasi**: Mengecek apakah target position berada dalam batas layar

### Struktur File

- `Kembang.pde` - File utama yang mengatur setup grid, animasi Phyllotaxis, dan rendering kurva Bézier
- `Node.pde` - Class untuk mengelola setiap node (posisi grid, target Phyllotaxis, animasi)

## 📐 Konsep Matematika

Project ini menggabungkan dua konsep geometri:

1. **Grid Regular**: Struktur kotak teratur dengan `cellSize` 99px
2. **Phyllotaxis**: Pola spiral yang ditemukan di alam (bunga matahari, pineapple, dll) menggunakan rumus:
   - `angle = index × 137.5°` (Golden Angle)
   - `radius = cellSize × 0.3 × √index`
   - `x = centerX + radius × cos(angle)`
   - `y = centerY + radius × sin(angle)`

## 📄 Lisensi

Copyright © 2025.

Proyek ini dilisensikan di bawah __Apache License 2.0__. Lihat file LICENSE untuk detail selengkapnya.

---

_Dibuat untuk eksplorasi kreatif dan visualisasi algoritma Phyllotaxis dengan kurva Bézier._

## 📮 Tentang

Project creative coding "Kembang" yang menghadirkan visualisasi transformasi grid menjadi pola spiral Phyllotaxis dengan kurva Bézier yang organik. Menggunakan algoritma Processing untuk menciptakan pola visual dinamis yang memadukan struktur matematis dengan keindahan alami. Interaktif, estetik, dan menarik.

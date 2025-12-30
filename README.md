# flutter_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Belajar Dart & Flutter - Mini Shopee Clone

Proyek ini adalah **aplikasi mini toko online** ala Shopee menggunakan **Flutter**.  
Tujuannya untuk belajar **Dart**, **Flutter widgets**, **State Management sederhana** menggunakan `ValueNotifier`, **GridView**, **Navigation**, dan **UI design responsif**.

---

## Fitur

- Halaman utama dengan **pencarian produk**.
- Produk ditampilkan dalam **grid**, lengkap dengan:
  - Nama produk
  - Harga
  - Rating & jumlah terjual
  - Tombol **Beli** dan **Keranjang**
- Detail produk menampilkan:
  - Gambar produk
  - Harga
  - Rating & jumlah terjual
  - Deskripsi produk
  - Tombol tambah ke keranjang & beli sekarang
- Halaman **Keranjang** menampilkan semua produk yang ditambahkan
  - Dapat menghapus item dari keranjang
  - Menampilkan total harga

---

## Screenshot (Contoh)

**HomePage:**
Gambar Grid Produk + Rating

makefile
Salin kode

**DetailPage:**
Gambar detail produk + rating + deskripsi

makefile
Salin kode

**CartPage:**
Daftar produk di keranjang + total harga

yaml
Salin kode

---

## Struktur Proyek

lib/
├── main.dart -> Semua kode aplikasi (Home, Detail, Cart)
assets/
├── images/
│ ├── sepatu.jpg
│ ├── baju.jpg
│ ├── tas.jpg
│ └── jam.jpg
pubspec.yaml -> Konfigurasi assets dan dependencies

yaml
Salin kode

---

## Cara Install & Run

### 1. Install Flutter

Ikuti panduan resmi Flutter:  
[Flutter Installation](https://docs.flutter.dev/get-started/install)

Pastikan `flutter doctor` **tidak ada error**.

```bash
flutter doctor
2. Clone Repo
bash
Salin kode
git clone <URL_REPO_ANDA>
cd <NAMA_FOLDER>
3. Install Dependencies
bash
Salin kode
flutter pub get
4. Jalankan Aplikasi
Jalankan di emulator atau device fisik:

bash
Salin kode
flutter run
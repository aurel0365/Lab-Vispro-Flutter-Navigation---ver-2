# Aplikasi Navigasi Flutter (Ver-2) 🚀

## 📜 Tujuan
Proyek ini bertujuan untuk menunjukkan kemampuan dalam mengelola navigasi dan rute yang lebih kompleks di Flutter. Fokus utama proyek ini meliputi penggunaan rute bernama, routing dinamis, struktur navigasi yang rumit, serta peningkatan antarmuka pengguna (UI) dan pengalaman pengguna (UX). ✨

---

## Penjelasan Pendekatan Tiap Layar

### Layar **First_Screen** 👋
Layar ini menampilkan gambar diri dan teks "Welcome to my codelab", yang berfungsi sebagai tampilan utama aplikasi saat pertama kali dijalankan dan berperan sebagai home di aplikasi
#### Fitur:
- Navigasi multi-layar menggunakan **BottomNavigationBar**. 📱
- Manajemen status real-time dengan **setState**. ⚡
- Umpan balik kesalahan melalui **Dialog** dan **Snackbar**. ❌
- Elemen UI yang dikustomisasi dengan warna, ikon, dan gambar. 🎨

#### Pendekatan yang digunakan:
- **Stateful Widget**: `FirstScreen` adalah widget bertipe `Stateful`, karena aplikasi memerlukan manajemen status untuk navigasi dan indeks layar aktif.
- **Komposisi Layar dengan Daftar Widget**: Layar aplikasi dikelola dalam daftar `_screens`, yang mencakup tiga widget: `FirstScreenContent`, `SecondScreen`, dan `ThirdScreen`. Navigasi antar layar dilakukan dengan mengganti konten berdasarkan indeks yang dipilih di `BottomNavigationBar`.
- **Validasi Navigasi**: Pendekatan defensif diterapkan untuk memvalidasi indeks yang diakses melalui `_onItemTapped` dan memberikan umpan balik jika terjadi kesalahan navigasi.

### Layar **Second_Screen** 👤
Layar ini menampilkan informasi pribadi pengguna, termasuk nama, deskripsi latar belakang, dan gambar profil. Layar ini dapat diakses melalui **BottomNavigationBar**.
#### Fitur:
- Navigasi kembali ke **FirstScreen** menggunakan tombol **Back** di **AppBar**. 🔙
- Tampilan informasi yang diatur dengan layout dua kolom: teks di kiri dan gambar profil di kanan. 📸
- Responsif menggunakan **SingleChildScrollView** untuk mendukung tampilan jika konten melebihi tinggi layar. 📜

#### Pendekatan yang digunakan:
- **Stateless Widget**: `SecondScreen` adalah widget bertipe `Stateless`, karena tampilan layar ini tidak memerlukan perubahan status setelah diinisialisasi.
- **Pengelolaan Navigasi**: Navigasi dari `SecondScreen` ke `FirstScreen` menggunakan `Navigator.pushAndRemoveUntil`, yang menggantikan semua rute sebelumnya dengan rute menuju `FirstScreen`.
- **Penyusunan Layout Responsif**: Layout menggunakan `Row` dan `Expanded` untuk menata konten secara responsif, dan gambar profil menyesuaikan ukuran menggunakan `BoxFit.cover`.

### Layar **Third_Screen** 🏃‍♂️
Layar ini memungkinkan pengguna untuk menghasilkan dan melihat daftar aktivitas berdasarkan input jumlah layar yang diminta. Pengguna dapat menavigasi antar layar aktivitas menggunakan tombol **Next** atau gerakan geser.
#### Fitur:
- Pengguna dapat memasukkan jumlah layar yang ingin dihasilkan melalui **TextField** dan menekan tombol "Generate Screens". ✍️
- Daftar aktivitas ditampilkan menggunakan **ListView.builder**, termasuk gambar, judul, dan deskripsi setiap aktivitas. 📚
- Navigasi antar layar aktivitas menggunakan gesekan horizontal atau tombol **Next**. ⬅️➡️
- Validasi input pengguna dengan menampilkan **Snackbar** jika nilai yang dimasukkan tidak valid. ⚠️
- Layar detail aktivitas menampilkan gambar, judul, deskripsi, dan tombol **Next** untuk melanjutkan ke aktivitas berikutnya.

#### Pendekatan yang digunakan:
- **Stateful Widget**: `ThirdScreen` adalah widget bertipe `Stateful` untuk manajemen status, menyimpan daftar aktivitas yang dihasilkan dan memperbarui UI saat data berubah.
- **Pengelolaan Input Pengguna**: Input jumlah layar diterima melalui **TextField**. Setelah tombol "Generate Screens" ditekan, `setState` digunakan untuk memperbarui daftar aktivitas yang ditampilkan.
- **Navigasi Layar Aktivitas**: Menggunakan `Navigator.push` dan `PageRouteBuilder` untuk mengarahkan pengguna ke layar detail aktivitas dengan animasi geser ke kiri. Fitur geser horizontal juga diterapkan di layar detail aktivitas untuk navigasi ke aktivitas berikutnya.
- **Desain Responsif**: Layout menggunakan `Column` dan `ListView.builder` untuk mendukung tampilan dinamis yang menyesuaikan ukuran konten dan perangkat.

---

## Kendala Selama Pengerjaan ⚙️
1. **Error "Bottom Overflowed by 51 Pixels" di Third Screen**:
   Error ini terjadi ketika widget (misalnya `Column`, `ListView`, atau `SingleChildScrollView`) melebihi ukuran layar yang tersedia. Solusi:
   - Bungkus konten dalam **SingleChildScrollView** agar dapat digulirkan saat konten melebihi layar. 🧑‍💻
   - Gunakan **Expanded** atau **Flexible** untuk elemen-elemen fleksibel dalam `Column`.
   - Atur properti `resizeToAvoidBottomInset` pada `Scaffold` ke `true` untuk menyesuaikan tampilan ketika keyboard muncul.
   - Gunakan **SafeArea** untuk memastikan konten tidak terpotong oleh area sistem.

---

## 🔧 Instalasi dan Menjalankan Aplikasi

Ikuti langkah-langkah berikut untuk memulai dengan proyek ini:

1. **Clone repositori ini**:
   ```bash
   git clone https://github.com/your-username/navigation_codelab.git

2. **Masuk ke direktori proyek:**:
   ```bash
   cd navigation_codelab
   
4. **Install dependensi:**
   ```bash
   flutter pub get
   
6. **Jalankan Aplikasi:**:
   ```bash
   flutter run

## 🛠️ Teknologi yang Digunakan
- Flutter: Framework untuk membangun aplikasi mobile lintas platform.
- Dart: Bahasa pemrograman yang digunakan dalam Flutter.

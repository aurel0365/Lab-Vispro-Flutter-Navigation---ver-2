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
Layar ini memungkinkan pengguna untuk menghasilkan dan melihat daftar layar aktivitas berdasarkan jumlah yang diinputkan. Pengguna dapat menavigasi layar dengan tombol Next, Previous, atau melalui gerakan geser horizontal.
#### Fitur:
- Input Jumlah Layar: Pengguna dapat memasukkan jumlah layar yang ingin dihasilkan melalui TextField. Setelah menekan tombol Enter, layar akan di-generate secara dinamis. ✍️
- Daftar Aktivitas: Setiap layar aktivitas menampilkan judul dan deskripsi yang dibuat secara dinamis. 💬
- Navigasi Antar Layar: Pengguna dapat berpindah antar layar menggunakan tombol Next, Previous, atau gerakan geser horizontal. ⬅️➡️
- Validasi Input: Input pengguna divalidasi. Jika nilai tidak valid, layar tidak dihasilkan. ⚠️
- Tampilan Dinamis: Menggunakan Hero Animation untuk memberikan transisi visual yang menarik antar layar. 🌟
- Navigasi Kembali: Ikon panah kembali di AppBar mengarahkan pengguna kembali ke layar pertama.
Pendekatan yang Digunakan:
- Stateful Widget: ThirdScreen menggunakan StatefulWidget untuk memantau status input dan daftar layar aktivitas yang dihasilkan.
- Pengelolaan Input: Input dari pengguna diproses menggunakan TextEditingController. Validasi diterapkan untuk memastikan angka valid.
- Navigasi Antar Layar: Menggunakan Navigator.push untuk berpindah antar layar, dan GestureDetector untuk mendukung navigasi melalui gesekan.
- Desain Responsif: Memanfaatkan Column, ListView.builder, dan Container agar layar terlihat optimal di berbagai ukuran perangkat.
#### Komponen Utama:
- ThirdScreen: Layar utama tempat input jumlah layar dilakukan.
- GeneratedScreen: Layar aktivitas dinamis dengan navigasi horizontal.

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

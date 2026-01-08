# GuideME

GuideME adalah aplikasi mobile berbasis Flutter yang membantu wisatawan menemukan destinasi, event, dan tiket perjalanan. Aplikasi ini memakai Firebase sebagai backend utama (Auth + Firestore) serta Supabase untuk kebutuhan tambahan seperti storage.

## Fitur Utama
- Autentikasi pengguna (registrasi, login, reset password).
- Beranda wisata dengan carousel, rekomendasi destinasi, dan daftar event.
- Katalog destinasi/event dengan detail dan status buka/tutup real-time.
- Modul tiket: pencarian, detail, checkout, dan histori pembelian.
- Panel admin untuk mengelola pengguna, destinasi, event, galeri, tiket, ulasan, dan laporan penjualan.
- Integrasi pembayaran menggunakan Midtrans (melalui backend token Snap).

## Teknologi
- Flutter 3 (Dart)
- Firebase (Auth, Firestore, Cloud Functions)
- Supabase (storage/layanan tambahan)
- Provider (state management)
- Flutter Map, Geolocator, dan utilitas pendukung lainnya

## Struktur Direktori
- `lib/main.dart` — entry point aplikasi dan konfigurasi Firebase/Supabase.
- `lib/views` — layar UI untuk user dan admin.
- `lib/controllers` — controller logika bisnis.
- `lib/models` — model data Firestore.
- `lib/widgets` — komponen UI reusable.
- `lib/core` — constants, layanan auth, utilitas, dan konfigurasi Firebase.
- `assets/` — gambar, ikon, dan font.

## Persyaratan
- Flutter SDK sesuai `pubspec.yaml` (>= 3.5.1).
- Firebase project aktif (konfigurasi ada di `lib/core/services/firebase_options.dart`).
- Backend Midtrans (opsional) untuk mendapatkan Snap token.

## Menjalankan Proyek
1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Jalankan aplikasi:
   ```bash
   flutter run
   ```

## Konfigurasi Layanan
- **Firebase**: konfigurasi sudah ada di `lib/core/services/firebase_options.dart`. Jika ingin mengganti project, jalankan ulang `flutterfire configure`.
- **Supabase**: URL dan anon key diset di `lib/main.dart`.
- **Midtrans**: endpoint token Snap di `lib/core/services/midtrans_service.dart`.

## Catatan
- Beberapa fitur (mis. pembayaran) membutuhkan backend eksternal agar berfungsi penuh.
- Pastikan aturan Firestore dan autentikasi sesuai kebutuhan lingkungan Anda.

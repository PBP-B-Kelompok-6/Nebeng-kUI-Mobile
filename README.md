# Nebeng-kUI Mobile

## Deskripsi Aplikasi
**Nebeng-kUI Mobile** adalah aplikasi *ride-sharing* atau berbagi tebengan berbasis *mobile* (Flutter) yang dikhususkan bagi mahasiswa di lingkungan Universitas Indonesia. Aplikasi ini merupakan perluasan ekosistem dari situs web **Nebeng-kUI** yang telah dibangun pada Proyek Tengah Semester, memungkinkan pengguna untuk menawarkan maupun mencari tumpangan saat berangkat dan pulang kampus secara praktis langsung dari perangkat seluler. Untuk mendorong partisipasi aktif, aplikasi ini juga dilengkapi dengan sistem *reward* (poin emisi) bagi pengguna yang memberikan tumpangan.

Manfaat aplikasi ini bagi sivitas akademika adalah membantu mahasiswa menghemat biaya transportasi, mengurangi kepadatan dan kesulitan mencari slot parkir di area kampus, serta berkontribusi langsung dalam menekan jejak emisi karbon dengan meminimalkan penggunaan kendaraan pribadi secara individu.

* **Tema Proyek:** Sustainable Living
* **Sub-tema:** Clean Energy & Carbon Footprint

---

## Anggota Kelompok
1. **Fadlan Fathul Islam** — `2506601275`
2. **Muhammad Ridho Anwar** — `2506595745`
3. **Andrew Chandra Halim** — `2506656431`
4. **Vincent Armando** — `2506618540`

---

## Peran dan Target Pengguna
**Target Pengguna:** Mahasiswa UI yang membawa kendaraan pribadi maupun mahasiswa yang membutuhkan tumpangan di sekitar lingkungan kampus.

**Peran Pengguna:**
1. **Pemberi Tebengan (*Driver*):** Pengguna yang membawa kendaraan pribadi (motor atau mobil) dan memiliki kapasitas kursi kosong untuk ditawarkan kepada mahasiswa lain.
2. **Pencari Tebengan (*Passenger*):** Pengguna yang mencari dan memesan tumpangan menuju atau dari lingkungan kampus.

> **Catatan:** Setiap akun pengguna bersifat fleksibel dan dapat berperan sebagai *Driver* maupun *Passenger* sesuai kebutuhan perjalanan.

---

## Daftar Modul dan Pembagian Kerja

Seluruh modul pada aplikasi *mobile* terhubung langsung dengan *web service* Django REST Framework (DRF) pada proyek situs web Nebeng-kUI:

### 1. Modul Profil, Kendaraan & Reward (*User Management*) — **Andrew Chandra Halim (`2506656431`)**
* **Deskripsi:** Mengelola informasi profil pengguna, pendataan kendaraan pribadi, serta tampilan sistem *reward* (poin pengurangan emisi) bagi pemberi tumpangan melalui antarmuka *mobile*.
* **Operasi CRUD via API:**
  * **Create:** Menambahkan data kendaraan baru (jenis kendaraan motor/mobil, pelat nomor, dan kapasitas kursi) melalui formulir *mobile*.
  * **Read:** Menampilkan halaman profil pengguna, daftar kendaraan terdaftar, dan akumulasi poin *reward* yang diperoleh *driver*.
  * **Update:** Memperbarui detail informasi profil atau kendaraan, serta sinkronisasi otomatis pembaruan poin *reward* ketika perjalanan tebengan selesai.
  * **Delete:** Menghapus data kendaraan yang sudah tidak digunakan.

### 2. Modul Forum Tebengan (*Social Media Feed*) — **Vincent Armando (`2506618540`)**
* **Deskripsi:** Menyediakan lini masa (*feed*) interaktif di aplikasi *mobile* bagi mahasiswa untuk memublikasikan dan menelusuri penawaran maupun pencarian tebengan.
* **Operasi CRUD via API:**
  * **Create:** Membuat unggahan tebengan baru (*"Mencari Tebengan"* atau *"Memberi Tebengan"*) lengkap dengan titik kumpul, tujuan, jadwal, dan kuota kursi maksimal.
  * **Read:** Mengambil dan menampilkan daftar unggahan tebengan yang masih berstatus aktif pada halaman utama forum.
  * **Update:** Memperbarui status unggahan secara otomatis menjadi *"Penuh"* (dan menyembunyikannya dari daftar aktif) apabila kapasitas kuota telah terpenuhi.
  * **Delete:** Menghapus unggahan tebengan yang dibuat oleh pengguna yang bersangkutan.

### 3. Modul Reservasi & Obrolan (*Booking & Chat*) — **Fadlan Fathul Islam (`2506601275`)**
* **Deskripsi:** Menangani proses pemesanan kursi tebengan serta fitur komunikasi (*chat*) untuk koordinasi titik temu antar-mahasiswa secara langsung di aplikasi *mobile*.
* **Operasi CRUD via API:**
  * **Create:** Membuat permintaan reservasi tebengan saat pengguna menekan tombol *"Join"* pada suatu unggahan, serta mengirimkan pesan baru di ruang obrolan.
  * **Read:** Menampilkan daftar kotak masuk (*Inbox*), status reservasi berjalan, dan riwayat percakapan antara *driver* dan *passenger*.
  * **Update:** Mengubah status reservasi oleh *driver* (*Diterima*, *Ditolak*, atau *Selesai*).
  * **Delete:** Membatalkan pengajuan reservasi yang masih tertunda atau menghapus riwayat pesan obrolan.

### 4. Modul Peta & Titik Kumpul (*Maps & Pick-up Points*) — **Muhammad Ridho Anwar (`2506595745`)**
* **Deskripsi:** Menampilkan lokasi titik kumpul strategis di sekitar kampus UI dan Depok (halte Bikun, stasiun KRL, gerbang kampus, dan area kos) serta mengelola titik kumpul favorit pengguna.
* **Operasi CRUD via API:**
  * **Create:** Menyimpan titik kumpul kustom atau favorit baru ke dalam daftar akun pribadi pengguna.
  * **Read:** Menampilkan daftar dan titik koordinat lokasi penjemputan strategis yang bersumber dari integrasi OpenStreetMap (Overpass API) pada backend Django.
  * **Update:** Menyunting catatan khusus pada titik kumpul favorit (contoh: *"Tunggu di depan pos satpam gerbang Kutek"*).
  * **Delete:** Menghapus titik kumpul dari daftar lokasi favorit pengguna.

---

## Alur Pengintegrasian Data dengan Web Service (Django REST Framework)

Aplikasi **Nebeng-kUI Mobile** menerapkan arsitektur *client-server* di mana seluruh penyimpanan *database* dan validasi logika bisnis tetap terpusat pada proyek situs web Django yang di-*deploy* di PWS, sedangkan aplikasi Flutter bertindak sebagai antarmuka pengguna (*client*).

Alur pertukaran data berjalan melalui tahapan berikut:
1. **Autentikasi & Manajemen Sesi:** Pengguna melakukan *login* atau *register* melalui layar autentikasi Flutter. Aplikasi mengirimkan kredensial secara asinkron menggunakan paket `pbp_django_auth` ke *endpoint* autentikasi DRF di PWS. Server memvalidasi akun dan mengembalikan *session cookie* yang disimpan oleh aplikasi untuk mengotorisasi permintaan berikutnya.
2. **Permintaan Data Asinkron (*HTTP Request*):** Saat pengguna membuka suatu halaman modul atau mengirimkan formulir, Flutter memanggil fungsi asinkron (`async`/`await`) untuk mengirim permintaan HTTP (`GET`, `POST`, `PUT`/`PATCH`, atau `DELETE`) ke *endpoint* URL Django REST Framework yang sesuai.
3. **Pemrosesan Logika Bisnis di Backend Django:** Server Django di PWS menerima permintaan tersebut, memverifikasi hak akses pengguna, menjalankan aturan bisnis (seperti pengecekan sisa kuota kursi atau perhitungan poin emisi), dan melakukan operasi pada *database* utama.
4. **Serialisasi & Rendering UI di Flutter:** Django REST Framework mengubah data dari *model* Django menjadi respons berformat **JSON** melalui *Serializer*. Aplikasi Flutter menerima respons JSON tersebut, memetakannya (*parsing*) ke dalam kelas *model* Dart (`fromJson`), dan memperbarui tampilan *widget* di layar secara reaktif.

---

## Tautan Penting
* **Tautan Deployment Web & API (PWS):** [https://muhammad-ridho52-nebengkui.pws.cs.ui.ac.id/](https://muhammad-ridho52-nebengkui.pws.cs.ui.ac.id/)
* **Tautan Desain UI/Wireframe Web (Referensi Proyek Tengah Semester):** [Figma Nebeng-kUI Web](https://www.figma.com/design/NBWjUCqdKOdoI8wgXfTb5E/Nebeng-kUI?node-id=0-1&t=calHUAJZhuKMqxEM-1)
* **Tautan Desain UI/Wireframe Mobile (Figma):** *[Akan ditambahkan setelah Checkpoint 1]*
* **Tautan Rilis APK (GitHub Releases & Bitrise):** *[Akan ditambahkan setelah Checkpoint 1]*
* **Tautan Video Promosi (Bonus):** *[Akan ditambahkan pada Pengumpulan Akhir]*

---

## Cara Menjalankan Proyek Secara Lokal
1. Pastikan **Flutter SDK** sudah terpasang dan terkonfigurasi dengan baik pada perangkat (verifikasi dengan menjalankan `flutter doctor`).
2. *Clone* repositori ini ke komputer lokal:
   ```bash
   git clone <URL_REPOSITORI_FLUTTER_KELOMPOK>
   cd <NAMA_FOLDER_PROYEK>
   ```
3. Unduh seluruh dependensi yang terdaftar pada `pubspec.yaml`:
   ```bash
   flutter pub get
   ```
4. Jalankan aplikasi pada emulator Android, perangkat fisik yang terhubung via USB Debugging, atau peramban Chrome:
   ```bash
   flutter run
   ```

---
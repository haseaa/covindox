# Covindox Flutter
# TK PBP C03

# PBP-C 2021/2022

## Nama Anggota
> Muhammad Imam Luthfi Balaka 2006524290  
> Elang Permana 2006520405  
> Denny Johannes Hasea 2006531264  
> Fauzan Andri 2006524593  
> Agastya Kenzo Nayandra 2006535905
> Fikri Aufaa Zain 2006484040  
> Michael Daw Balma 2006520746  

## Deskripsi Aplikasi  
Di masa pandemi ini, kita dipaksa untuk melakukan semua kegiatan di rumah dengan tujunan untuk mengurangi korban Covid-19 di Indonesia. Oleh karena itu, tingkat penggunaan teknologi seperti _smartphone_ dan komputer akan meningkat yang dikarenakan semua kegiatan akan berbasis _online_. Dengan adanya semua aspek tersebut, kelompok kami membuat suatu aplikasi yang dimana masyarakat dapat menggunakan aplikasi ini untuk mendaptkan informasi tentang Covid-19 yang terbaru dan memberikan sebuah artikel tentang apa yang harus dilakukan di masa pandemi ini. Tidak hanya memberikan informasi, aplikasi ini dapat menyediakan jadwal vaksinasi seseorang jika ingin melakukan vaksinasi dan terdapat _hotline_ yang dimana pengguna dapat melapor ke pihak staff dan admin jika ada laporan mengenai Covid-19.


## List Modul  
- Berita: Elang Permana  
- Landing Page, User Profile, Login/Registration systems: Fikri Aufaa Zain  
- Jadwal Vaksinasi: Fauzan Andri  
- Halaman Pengaduan: Agastya Kenzo Nayandra  
- Pendaftaran Vaksinasi: Muhammad Imam Luthfi Balaka  
- Text generator penyemangat: Michael Daw Balma  


## Cerita Daftar Modul  
**1. Modul berita (Elang Permana)**  
**2. Modul Landing Page, User Profile, Login/Registration systems (Fikri Aufaa Zain.)**  
Modul ini memberikan akun kepada user yang mendaftar pada website covindox yang dimana data yang disimpan akan terhubung ke *database* yang ada pada django. Semua yang terintegrasikan di *website* akan diimplementasikan ke dalam bentuk aplikasi seperti *profile page*, *login page*, *registration page*.  
**3. Modul jadwal vaksinasi (Fauzan Andri)**  
Modul ini bersinergi dengan modul daftar vaksin untuk menyediakan tanggal dan waktu vaksin yang dapat dipilih oleh pengguna. Dengan memanfaatkan event calendar, admin dapat menambahkan jadwal vaksin yang selanjutnya akan ditampilkan kepada pengguna agar dapat memilih jadwal vaksin yang sesuai.  
**4. Modul artikel (Denny Johannes Hasea)**  
Modul ini berisi tentang kumpulan artikel yang dapat dibaca orang ketika senggang yang mungkin dapat menambah wawasan.  
**5. Modul halaman pangaduan (Agastya Kenzo Nayandra)**  
Modul ini akan berisi feedback dari pengguna yang dapat berupa laporan bug di aplikasi atau masukan yang dapat di implementasikan kedepanya  
**6. Modul Form Pendaftaran (Muhammad Imam Luthfi Balaka)**  
Modul ini berkaitan dengan modul jadwal vaksinasi, yaitu dalam hal menyediakan form untuk mendaftar pada jadwal yang sudah dipilih pada modul jadwal vaksinasi. Aplikasi akan melakukan async http get ke web service untuk mengecek apakah user yang sedang login sudah mendaftar. Jika iya, ditampilkan datanya, jika belum, diberikan form untuk mengisi data.  
**7. Modul text generator penyemangat (Michael Daw Balma)**  
Modul ini bertujuan agar kita tetap dapat semangat di masa pandemi. Implementasinya yaitu user yang sudah login dapat memasukkan kata-kata random sebagai penyemangat, lalu kata-kata tersebut akan disimpan pada database. Setelah itu akan dimunculkan dalam bentuk acak (muncul katanya yang acak).




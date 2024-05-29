import 'package:flutter/material.dart';

class Werno {
  static const Color utama = Color.fromARGB(255, 255, 181, 52);
  static const Color utamaPudar = Color.fromARGB(255, 245, 221, 97);
  static const Color hitam = Color.fromARGB(255, 25, 25, 25);
  static const Color abuprawan = Color.fromARGB(255, 227, 225, 217);
  static const Color abujanda = Color.fromARGB(255, 180, 180, 184);
  static const Color putih = Color.fromARGB(255, 255, 247, 241);

  // ops
  static const Color biru = Color.fromARGB(255, 3, 174, 210);
  static const Color merah = Color.fromARGB(255, 231, 41, 41);
  static const Color hijau = Color.fromARGB(255, 101, 183, 65);
}

class ikone {
  static const IconData penghuni = (Icons.person_pin_rounded);
  static const IconData kamar = (Icons.bed);
  static const IconData lunas = (Icons.attach_money_sharp);
  static const IconData blmLunas = (Icons.money_off);
  static const IconData panah = (Icons.arrow_circle_right_sharp);
  static const IconData lainX = (Icons.more_horiz);
  static const IconData lainY = (Icons.more_vert);
  static const IconData user = (Icons.person);
  static const IconData setelan = (Icons.settings);
  static const IconData pw = (Icons.lock);

  // crud
  static const IconData tambah = (Icons.add);
  static const IconData edit = (Icons.edit_square);
  static const IconData simpan = (Icons.save);
  static const IconData hapus = (Icons.delete_forever);
  // static const IconData lihat = (Icons.remove_red_eye);
  //======//
}

class Topbar extends StatelessWidget implements PreferredSizeWidget {
  final String judul;
  final List<Widget>? aksi;  // Membuat aksi bersifat opsional

  Topbar({
    required this.judul,
    this.aksi,  // Menambahkan parameter aksi sebagai opsional
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        judul,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Werno.hitam,  // Gantilah dengan Werno.hitam jika ada
        ),
      ),
      actions: aksi,  // Menggunakan actions di dalam AppBar
      centerTitle: false,
      scrolledUnderElevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: Werno.utama,  // Gantilah dengan Werno.utama jika ada
          height: 0.8,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


  // button
FloatingActionButton TombolTambah(VoidCallback onPressed){
  return FloatingActionButton.extended(
      backgroundColor: Werno.utama,
      onPressed: onPressed,
      label: Text(
        "Tambah",
        style: TextStyle(color: Werno.putih),
      ),
      icon: Icon(
        ikone.tambah,
        color: Werno.putih,
      ),
    );
}

FloatingActionButton TombolSimpan(VoidCallback onPressed){
  return FloatingActionButton.extended(
      backgroundColor: Werno.hijau,
      onPressed: onPressed,
      label: Text(
        "Simpan",
        style: TextStyle(color: Werno.putih),
      ),
      icon: Icon(
        ikone.simpan,
        color: Werno.putih,
      ),
    );
}


class Penghuni {
  final int id;
  final String nama;
  final String noTelp;
  final String jenisKelamin;
  final String status;
  final String tanggalMasuk;
  final String tanggalKeluar;
  final String foto;
  final int idRuang;
  final String? namaRuang;

  Penghuni({
    required this.id,
    required this.nama,
    required this.noTelp,
    required this.jenisKelamin,
    required this.status,
    required this.tanggalMasuk,
    required this.tanggalKeluar,
    required this.foto,
    required this.idRuang,
    this.namaRuang,
  });

  factory Penghuni.fromJson(Map<String, dynamic> json) {
    return Penghuni(
      id: json['id'],
      nama: json['nama'],
      noTelp: json['no_telp'],
      jenisKelamin: json['jenis_kelamin'],
      status: json['status'],
      tanggalMasuk: json['tanggal_masuk'],
      tanggalKeluar: json['tanggal_keluar'],
      foto: json['foto'],
      idRuang: json['id_ruang'],
      namaRuang: json['ruang'] != null ? json['ruang']['nama_ruang'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'no_telp': noTelp,
      'jenis_kelamin': jenisKelamin,
      'status': status,
      'tanggal_masuk': tanggalMasuk,
      'tanggal_keluar': tanggalKeluar,
      'foto': foto,
      'id_ruang': idRuang,
      'nama_ruang': namaRuang,
    };
  }
}

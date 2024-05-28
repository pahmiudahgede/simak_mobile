class PenghuniRuang {
  final String nama;

  PenghuniRuang({required this.nama});

  factory PenghuniRuang.fromJson(Map<String, dynamic> json) {
    return PenghuniRuang(
      nama: json['nama'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
    };
  }
}

class Room {
  final int id;
  final String namaRuang;
  final int kapasitas;
  final String? statusKapasitas; // Make it nullable
  final double hargaBulan;
  final int luas;
  final List<PenghuniRuang>? penghunis; // Make it nullable

  Room({
    required this.id,
    required this.namaRuang,
    required this.kapasitas,
    this.statusKapasitas, // Update here
    required this.hargaBulan,
    required this.luas,
    this.penghunis, // Update here
  });

  // Receive
  factory Room.fromJson(Map<String, dynamic> json) {
    var list = json['penghunis'] as List?;
    List<PenghuniRuang>? penghuniList;
    if (list != null) {
      penghuniList = list.map((i) => PenghuniRuang.fromJson(i)).toList();
    }

    return Room(
      id: json['id'],
      namaRuang: json['nama_ruang'],
      kapasitas: json['kapasitas'],
      statusKapasitas: json['status_kapasitas'],
      hargaBulan: json['harga_bulan'].toDouble(),
      luas: json['luas'],
      penghunis: penghuniList,
    );
  }

  // Send
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_ruang': namaRuang,
      'kapasitas': kapasitas,
      'status_kapasitas': statusKapasitas, // Update here
      'harga_bulan': hargaBulan,
      'luas': luas,
      'penghunis': penghunis?.map((p) => p.toJson()).toList(), // Update here
    };
  }
}

class Room {
  final int id;
  final String namaRuang;
  final int kapasitas;
  final String statusKapasitas;
  final double hargaBulan;
  final int luas;

  Room({
    required this.id,
    required this.namaRuang,
    required this.kapasitas,
    required this.statusKapasitas,
    required this.hargaBulan,
    required this.luas,
  });

  // Receive
  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      namaRuang: json['nama_ruang'],
      kapasitas: json['kapasitas'],
      statusKapasitas: json['status_kapasitas'],
      hargaBulan: json['harga_bulan'].toDouble(),
      luas: json['luas'],
    );
  }

  // Send
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_ruang': namaRuang,
      'kapasitas': kapasitas,
      'status_kapasitas': statusKapasitas,
      'harga_bulan': hargaBulan,
      'luas': luas,
    };
  }
}

import '../models/ruang.dart';

class DetailTagihan {
  final int id;
  final double? jumlahTagihan;
  final String? status;
  final int idRuang;
  final String? fotoBukti;
  final String? tanggal;
  final Room? ruang;
  final String? imageUrl;

  DetailTagihan({
    required this.id,
    this.jumlahTagihan,
    this.status,
    required this.idRuang,
    this.fotoBukti,
    this.tanggal,
    this.ruang,
    this.imageUrl,
  });

  factory DetailTagihan.fromJson(Map<String, dynamic> json) {
    return DetailTagihan(
      id: json['id'],
      jumlahTagihan: (json['jumlah_tagihan'] as num?)?.toDouble(),
      status: json['status'],
      idRuang: json['id_ruang'],
      fotoBukti: json['foto_bukti'],
      tanggal: json['tanggal'],
      ruang: json['ruang'] != null ? Room.fromJson(json['ruang']) : null,
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jumlah_tagihan': jumlahTagihan,
      'status': status,
      'id_ruang': idRuang,
      'foto_bukti': fotoBukti,
      'tanggal': tanggal,
      'ruang': ruang?.toJson(),
      'image_url': imageUrl,
    };
  }
}

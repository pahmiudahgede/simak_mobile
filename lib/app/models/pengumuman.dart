class Pengumuman {
  final int id;
  final String judul;
  final String deskripsi;
  final String createdAt;
  final String updatedAt;

  Pengumuman({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pengumuman.fromJson(Map<String, dynamic> json) {
    return Pengumuman(
      id: json['id'],
      judul: json['title'],
      deskripsi: json['message'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
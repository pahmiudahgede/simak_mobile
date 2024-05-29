import 'package:get/get.dart';

import 'dart:convert';

class PengumumanProvider extends GetConnect {
  final BaseurlPengumuman = 'http://192.168.1.7:8000/api/pengumumans';

  final Map<String, String> myHeader = {
    'Accept': 'application/json',
  };

  Future<Response> getAllPengumumans() {
    return get(BaseurlPengumuman, headers: myHeader);
  }

  Future<Response> createPengumuman(
    String title,
    String message,
  ) {
    final body = jsonEncode({
      "title": title,
      "message": message,
    });
    return post(BaseurlPengumuman, body, headers: myHeader);
  }

  Future<Response> editPengumuman(int id, String title, String message) {
    final body = jsonEncode({
      "title": title,
      "message": message,
    });
    return put('$BaseurlPengumuman/$id', body, headers: myHeader);
  }

  Future<Response> deletePengumuman(int id) {
    return delete('$BaseurlPengumuman/$id');
  }

  Future<Response> deleteAllPengumumans() {
    return delete(BaseurlPengumuman, headers: myHeader);
  }
}

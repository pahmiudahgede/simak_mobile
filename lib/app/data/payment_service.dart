import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PaymentService extends GetConnect {
  final baseurl = 'http://192.168.1.3:8000/api';

  Future<Response> fetchPembayarans() {
    return get('$baseurl/pembayarans');
  }

  Future<http.Response> konfirmasiPembayaran(int detailTagihanId) async {
    try {
      var url = Uri.parse('$baseurl/konfirmasiPembayaran');
      var response = await http.post(
        url,
        body: {
          'detailTagihanId': detailTagihanId.toString(),
        },
      );

      return response;
    } catch (e) {
      print('Error confirming payment: $e');
      return http.Response('Error confirming payment: $e', 500);
    }
  }
}

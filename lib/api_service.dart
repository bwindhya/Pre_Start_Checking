import 'model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' show Client;

class ApiService {
  // final baseUrl = Uri.parse("http://127.0.0.1:5000");
  Client client = Client();

// Future<List<data_model>> - sebelumnya seperti ini
  Future<List<data_model>?> getModel() async {
    final response =
        await client.get(Uri.parse("http://103.215.25.253:5000/users"));
    if (response.statusCode == 200) {
      return modelFromJson(response.body);
    } else {
      return null;
    }
  }
}

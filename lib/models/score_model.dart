import 'dart:async';
import 'dart:convert';
import 'package:ctf_clicker/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class Score {
  Timer? _timer;
  String path = ApiEndpoints.getScore;

  Future<List<dynamic>> scoreDataRequest() async {
    try {
      final response = await http.get(Uri.parse(path));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) {
          if (item.containsKey('id') &&
              item.containsKey('name') &&
              item.containsKey('score')) {
            return {
              'id': item['id'],
              'name': item['name'],
              'score': item['score']
            };
          } else {
            throw Exception('Некорректный формат данных');
          }
        }).toList();
      } else {
        throw Exception('Не удалось получить данные с сервера');
      }
    } catch (e) {
      throw Exception('Ошибка при запросе данных: $e');
    }
  }

  void startRequestData(Function(List<dynamic>) onDataReceived) {
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      try {
        final data = await scoreDataRequest();
        onDataReceived(data);
      } catch (e) {
        print(e);
      }
    });
  }

  void stopRequestData() {
    _timer?.cancel();
  }
}

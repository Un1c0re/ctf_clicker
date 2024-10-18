import 'dart:async';
import 'package:ctf_clicker/utils/exceptions.dart';
import 'package:http/http.dart' as http;

class DataSender {
  Timer? _timer;

  Future<void> sendDataToServer(String path) async {
    try {
      await http.post(Uri.parse(path));
    } catch (e) {
      throw SendDataException('Не удалось отправить данные: $e');
    }
  }

  void startSendingData(String Function() getPath) {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      final path = getPath();
      sendDataToServer(path);
    });
  }

  void stopSendingData() {
    _timer?.cancel();
  }
}

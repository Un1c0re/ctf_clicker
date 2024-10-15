import 'package:ctf_clicker/models/score_model.dart';
import 'package:get/get.dart';

class ScoreController extends GetxController {
  var scoreData = <dynamic>[].obs;
  final Score _scoreService = Score();

  @override
  void onInit() {
    super.onInit();
    _scoreService.startRequestData((data) {
      scoreData.value = data;
    });
  }

  @override
  void onClose() {
    _scoreService.stopRequestData();
    super.onClose();
  }
}

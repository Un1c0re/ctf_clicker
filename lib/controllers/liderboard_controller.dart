import 'package:get/get.dart';

import '../utils/constants.dart';

class ScoreController extends GetxController {
  List<dynamic> getData() {
    List<dynamic> data = RAW_DATA;
    data.sort((a, b) => b['value'].compareTo(a['value']));
    return data;
  }
}

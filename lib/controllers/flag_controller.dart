import 'package:get/get.dart';

import '../models/flag_model.dart';

class FlagController extends GetxController {
  Flag flag = Flag.defaultFlag();

  bool isFlag() => flag.value.isNotEmpty;

  Flag getFlag() => flag;

  void getFlagValue() {}
}

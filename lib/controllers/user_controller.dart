import 'package:ctf_clicker/models/skin_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  Skin currentSkin = Skin.defaultSkin();

  Skin getSkin() => currentSkin;

  void setSkin(Skin newSkin) => currentSkin = newSkin;
}

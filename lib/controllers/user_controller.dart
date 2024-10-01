import 'package:ctf_clicker/models/skin_model.dart';
import 'package:ctf_clicker/models/user_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  Skin currentSkin = Skin.defaultSkin();
  final UserModel _user =
      UserModel(id: 0, name: 'userdude', count: 0, skin: Skin.defaultSkin());

  Skin getSkin() => currentSkin;

  set setSkin(Skin newSkin) => currentSkin = newSkin;

  UserModel user() => _user;
}

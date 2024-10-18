import 'dart:convert';

import 'package:ctf_clicker/utils/methods.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ctf_clicker/models/skin_model.dart';
import 'package:ctf_clicker/models/user_model.dart';
import 'package:ctf_clicker/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/sender_model.dart';
import '../utils/exceptions.dart';

class UserController extends GetxController {
  Skin currentSkin = Skin.defaultSkin();
  final DataSender _sender = DataSender();
  UserModel? _user;

  @override
  void onInit() async {
    super.onInit();
    _sender.startSendingData(() {
      final updateUserApi = ApiEndpoints.updateUserWallet(_user!.id);
      return '$updateUserApi?wallet=${_user!.wallet}';
    });
  }

  UserModel? getUser() => _user;

  Skin getSkin() => currentSkin;

  void setWallet(double value) => _user?.wallet = value;

  set setSkin(Skin newSkin) => currentSkin = newSkin;

  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> loadUserData() async {
    String? userId = await getUserId();
    late final http.Response response;

    if (userId != null) {
      response = await http.get(Uri.parse(ApiEndpoints.getUserById(userId)));
    } else {
      response = await http.post(
          Uri.parse('${ApiEndpoints.createUser}?username=${generateUsername()}'));
    }

    if (response.statusCode != 200) throw RequestDataException();

    final data = jsonDecode(response.body);
    _user = UserModel.fromMap(data);

    if (userId == null) await saveUserId(_user!.id.toString());
  }

  @override
  void onClose() {
    _sender.stopSendingData();
    super.onClose();
  }
}

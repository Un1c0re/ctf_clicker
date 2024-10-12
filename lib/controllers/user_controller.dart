import 'dart:convert';

import 'package:ctf_clicker/models/skin_model.dart';
import 'package:ctf_clicker/models/user_model.dart';
import 'package:ctf_clicker/utils/api_endpoints.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  Skin currentSkin = Skin.defaultSkin();
  UserModel? _user;

  Skin getSkin() => currentSkin;

  set setSkin(Skin newSkin) => currentSkin = newSkin;

  UserModel? getUser() => _user;

  Future<void> regUser() async {
    final UserModel newUser = UserModel.newUser();
    const userApi = ApiEndpoints.createUser;
    try {
      final response = await http
          .post(Uri.parse('$userApi?username=${newUser.name.toString()}'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _user = UserModel.fromMap(data);
      }
    } catch (error) {
      throw Exception('Failed to create user');
    }
  }
}

import 'dart:convert';

import 'package:ctf_clicker/data/db_service.dart';
import 'package:ctf_clicker/models/skin_model.dart';
import 'package:ctf_clicker/models/user_model.dart';
import 'package:ctf_clicker/utils/api_endpoints.dart';
import 'package:ctf_clicker/utils/exceptions.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../models/sender_model.dart';

class UserController extends GetxController {
  final service = DatabaseService();
  Skin currentSkin = Skin.defaultSkin();
  final DataSender _sender = DataSender();
  UserModel? _user;

  UserModel? getUser() => _user;

  Skin getSkin() => currentSkin;

  void setWallet(double value) => _user?.wallet = value;

  set setSkin(Skin newSkin) => currentSkin = newSkin;

  Future<void> regUser() async {
    final UserModel newUser = UserModel.newUser();
    const createUserApi = ApiEndpoints.createUser;

    final response = await http
        .post(Uri.parse('$createUserApi?username=${newUser.name.toString()}'));
    if (response.statusCode != 200) throw CreateUserException();

    final data = jsonDecode(response.body);
    _user = UserModel.fromMap(data);

    await updateUserRemote();
    // await updateUserInDb(_user!);
  }

  Future<void> updateUserRemote() async {
    _sender.startSendingData(() {
      final updateUserApi = ApiEndpoints.updateUserWallet(_user!.id);
      return '$updateUserApi?wallet=${_user!.wallet}';
    });
  }

  // Future<void> updateUserInDb(UserModel newUser) async {
  //   final DatabaseService databaseService = Get.find();
  //   User userForSave = User(id: newUser.id, name: newUser.name, count: newUser.wallet);
  //   await databaseService.database.userDao.updateUser(userForSave);
  // }

  @override
  void onClose() {
    _sender.stopSendingData();
    super.onClose();
  }
}

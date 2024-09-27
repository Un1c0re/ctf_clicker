import 'package:ctf_clicker/models/skin_model.dart';

class UserModel {
  final int id;
  final String name;
  int count = 0;
  Skin skin;

  UserModel({
    required this.id,
    required this.name,
    required this.count,
    required this.skin,
  });

  String get username => name;

  int get userCount => count;

  set userCount(int value) => count = value;

  Skin get userSkin => skin;

  set userSkin(Skin newSkin) => skin = newSkin;
}

import 'package:ctf_clicker/models/skin_model.dart';

class UserModel {
  final int id;
  final String name;
  double wallet = 0;
  Skin skin = Skin.defaultSkin();

  UserModel({
    required this.id,
    required this.name,
    this.wallet = 0,
  });

  String get username => name;

  double get userCount => wallet;

  set userCount(double value) => wallet = value;

  Skin get userSkin => skin;

  set userSkin(Skin newSkin) => skin = newSkin;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      wallet: map['wallet'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'wallet': wallet,
    };
  }
}

class UserModel {
  final int id;
  final String name;
  final int count;

  UserModel({
    required this.id,
    required this.name,
    required this.count,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      count: map['count'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'count': count,
    };
  }
}

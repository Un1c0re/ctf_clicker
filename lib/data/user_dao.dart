import 'package:drift/drift.dart';
import 'db.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  final Database db;

  UserDao(this.db) : super(db);

  Future<int> insertUser(UsersCompanion user) => into(users).insert(user);

  Future<User?> getUserById(int id) =>
      (select(users)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<bool> updateUser(User user) => update(users).replace(user);

  Future<int> deleteUser(int id) =>
      (delete(users)..where((tbl) => tbl.id.equals(id))).go();
}

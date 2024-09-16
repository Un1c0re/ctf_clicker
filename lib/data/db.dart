import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'user_dao.dart';

part 'db.g.dart';

////////////////////////////////// USERS //////////////////////////////////////

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get count => integer().withDefault(const Constant(0))();
}

////////////////////////////////// APPDATABASE ////////////////////////////////

@DriftDatabase(tables: [Users], daos: [UserDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  late UserDao userDao = UserDao(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

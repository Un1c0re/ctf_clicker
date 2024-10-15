import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import 'db.dart';

class DatabaseService extends GetxService {
  late Database _database;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<DatabaseService> init() async {
    _database = Database();
    return this;
  }

  Database get database => _database;
}

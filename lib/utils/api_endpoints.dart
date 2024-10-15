class ApiEndpoints {
  static const String baseUrl = 'http://192.168.1.187:8888';
  static const String userUrl = '/users';
  static const String flagUrl = '/flags';

  static const String createUser = '$baseUrl$userUrl/reg/';

  static const String getUsers = '$baseUrl$userUrl/';

  static String getUserById(int userId) => '$baseUrl$userUrl/$userId/';

  static String updateUserWallet(int userId) => '$baseUrl$userUrl/$userId';

  static String getScore = '$baseUrl$userUrl/score/';

  static String getFlag = '$baseUrl$flagUrl/';
}

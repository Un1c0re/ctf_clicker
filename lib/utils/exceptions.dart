class CreateUserException implements Exception {
  final String message;

  CreateUserException([this.message = 'Не удалось создать пользователя']);

  @override
  String toString() {
    return message.isEmpty
        ? 'CreateUserException'
        : 'CreateUserException: $message';
  }
}

class SendDataException implements Exception {
  final String message;

  SendDataException([this.message = 'Не удалось отправить данные на сервер']);

  @override
  String toString() {
    return message.isEmpty
        ? 'SendDataException'
        : 'SendDataException: $message';
  }
}

class RequestDataException implements Exception {
  final String message;

  RequestDataException([this.message = 'Не удалось получить данные с сервера']);

  @override
  String toString() {
    return message.isEmpty
        ? 'RequestDataException'
        : 'RequestDataException: $message';
  }
}

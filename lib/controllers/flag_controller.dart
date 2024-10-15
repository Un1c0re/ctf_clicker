import 'dart:convert';

import 'package:ctf_clicker/utils/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/flag_model.dart';

class FlagController extends GetxController {
  final flag = Flag.defaultFlag().obs;
  final _flagApi = ApiEndpoints.getFlag;

  bool isFlag() => flag.value.flag.isNotEmpty;

  Flag getFlag() => flag.value;

  Future<void> getFlagValue() async {
    try {
      final response = await http.get(Uri.parse(_flagApi));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        flag.value = Flag.fromJson(jsonData);
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      print('Произошла ошибка: $e');
    }
  }
}

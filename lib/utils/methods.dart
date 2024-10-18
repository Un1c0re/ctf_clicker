import 'package:random_name_generator/random_name_generator.dart';

String generateUsername() => RandomNames(Zone.china).name().replaceAll(' ', '');

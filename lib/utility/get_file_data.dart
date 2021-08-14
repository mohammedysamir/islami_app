



import 'package:flutter/services.dart';

Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
}
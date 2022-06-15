import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Utils {
  static Future<String> dosyaYolu() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> dosyaGetir() async {
    final path = await dosyaYolu();
    return File('$path/kullanici_bilgi.txt');
  }

  static Future<File> dosyayiKaydet(dynamic data) async {
    final file = await dosyaGetir();

    return file.writeAsString(data);
  }

  static Future<String> dosyayiOku() async {
    try {
      final file = await dosyaGetir();
      return await file.readAsString();
    } catch (e) {
      return 'hata';
    }
  }
}

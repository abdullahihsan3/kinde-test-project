  import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

Future<Box> hiveEncryptedBox() async {
    // Hive Encrypted Box Added
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    String? key = await secureStorage.read(key: 'encryptionKey');
    var encryptionKey = base64Url.decode(key!);
    var box = await Hive.openBox('myBox',
        encryptionCipher: HiveAesCipher(encryptionKey));
    return box;
  }
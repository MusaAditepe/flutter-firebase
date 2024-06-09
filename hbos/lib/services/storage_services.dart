import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  String errorMessage = "";

  Future<String> uploadFile(
      String fileFolder, String fileName, File file) async {
    try {
      await FirebaseStorage.instance
          .ref("uploads/" + fileFolder + "/" + fileName + ".png")
          .putFile(file);
      String downloadURL = await FirebaseStorage.instance
          .ref("uploads/" + fileFolder + "/" + fileName + ".png")
          .getDownloadURL();
      return downloadURL;
    } catch (error) {
      errorMessage = "TECHNICAL_ERROR";
    }

    return "";
  }
}

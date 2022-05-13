import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FileService {
  FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadImage(File file) async {
    Reference ref = _storage.ref().child("/avatar").child("");
    UploadTask task = ref.putFile(file);
    final TaskSnapshot downloadUrl = await task;
    String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }
}

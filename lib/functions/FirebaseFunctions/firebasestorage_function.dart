import 'dart:io';

import 'package:courses_app/view_model/boolsetter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseStorageFunction {
  final _storage = FirebaseStorage.instance;
  // image Uploade FirebadseStorage and Downlode URL

  Future<String> addimageStorage(File file, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    String imageURL = "";
    try {
      final String id = DateTime.now().millisecondsSinceEpoch.toString() +
          file.path.split("/").last;
      final Reference reference = _storage.ref().child("media/$id");
      await reference.putFile(file);
      imageURL = await reference.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
    return imageURL;
  }

  Future<String> imageUpdate(
      String imageURL, File file, BuildContext context) async {
    final loading = Provider.of<BoolSetter>(context, listen: false);
    loading.setloading(true);
    String imageurl = "";
    try {
      final reference = _storage.refFromURL(imageURL);
      await reference.putFile(file);
      imageurl = await reference.getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loading.setloading(false);
    }
    return imageurl;
  }
}

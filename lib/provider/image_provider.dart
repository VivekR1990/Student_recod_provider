import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageProvide extends ChangeNotifier {
  File? image;
  File? get selectedImage => image;
  Future<void> selectImageFromGalleryOrCamera(ImageSource option) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: option);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        notifyListeners();
      }
    } catch (e) {
      throw Exception('Error selecting image: $e');
    }
  }

  void setImage(File pickedImage) {
    image = pickedImage;
  }

  void clearImge() {
    image = null;
    notifyListeners();
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePic extends ChangeNotifier {
  File _image;

  File get image => _image;
  getImage() async {
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }
}

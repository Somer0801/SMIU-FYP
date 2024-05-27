import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  final Rx<File?> image = Rx<File?>(null);

  var isLoading = false.obs;

  void pickImage() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage == null) {
        print('No image picked.');
        return;
      }

      final imageTemp = File(pickedImage.path);

      image.value = imageTemp;
      print(image.value);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

}
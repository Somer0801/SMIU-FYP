import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:smiu/models/profile_model.dart';

import '../appUrls/appUrl.dart';
import '../components/colors.dart';
import '../global/alertbox.dart';
import '../global/custom_snackbar.dart';
import '../local_storage/get_storage.dart';

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

  postProfile(ProfileModel model) async {
    showDialogue();
    String currentToken = appStorage.read('userToken');

    try {
      var request =
      http.MultipartRequest('POST', Uri.parse(' '))
        ..headers['Authorization'] = 'Bearer $currentToken'
        ..headers['Accept'] = 'application/json'
        ..fields['name'] = model.name!
        ..fields['roll_number'] = model.rollNumber!;
      List<http.MultipartFile> files = [];

      if (model.profileImg != null) {
        files.add(await http.MultipartFile.fromPath(
          'profile',
          model.profileImg!,
        ));
      }
      request.files.addAll(files);

      var response = await request.send();
      final Map<String, dynamic> responseData =
      json.decode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        Get.back();

        showInSnackBar("${responseData["message"]}",
            color: AppColors.primaryColor);


      } else {
        print("Response: ${responseData["message"]}");

      }
    } catch (error) {
      showInSnackBar("Error: $error", color: AppColors.errorcolor);
      Get.back();

      print("Error: $error");
    }
  }

}
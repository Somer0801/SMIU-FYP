import 'dart:convert';
import 'package:get/get.dart';
import 'package:smiu/adminScreens/admin_dashborad_screen.dart';
import 'package:smiu/adminScreens/admin_login_screen.dart';
import 'package:smiu/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:smiu/student_screens/student_dashboard.dart';
import 'package:smiu/student_screens/studentlogin.dart';
import 'package:smiu/supervisorScreens/supervisor_dashboard.dart';
import 'package:smiu/supervisorScreens/supervsior_login.dart';
import '../appUrls/appUrl.dart';
import '../components/colors.dart';
import '../global/alertbox.dart';
import '../global/custom_snackbar.dart';
import '../local_storage/get_storage.dart';

class AuthController extends GetxController{

signInUser(userModel userData) async {
  showDialogue();
  print(userData.university_id);
  print(userData.password);
  // print(userData.role);

  try {
    final response = await http.post(
      Uri.parse(AppUrl.loginUrl),
      body: {
        "university_id": userData.university_id,
        "password": userData.password,


      },
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    Get.back();
    print(response.statusCode);
    print(responseData);
    if (response.statusCode == 200) {
      if (responseData["success"] == true) {
        if (responseData["data"]["user"]["role"] == "student") {
          appStorage.write(studentToken, responseData["data"]["token"]);

          appStorage.write(studentId, responseData["data"]["user"]["university_id"]);
          appStorage.write(studentName, responseData["data"]["user"]["name"]);
          print("Student Token:${appStorage.read(studentToken)}");
          print("Student ID ${appStorage.read(studentId)}");
          print("Student name${appStorage.read(studentName)}");
          Get.offAll(StudentDashboardScreen());
        }
        else if (responseData["data"]["user"]["role"] == "supervisor") {
          appStorage.write(professorToken, responseData["data"]["token"]);
          appStorage.write(professorId, responseData["data"]["user"]["university_id"]);
          appStorage.write(professorName, responseData["data"]["user"]["name"]);
          print(appStorage.read(professorToken));
          print(appStorage.read(professorId));
          print(appStorage.read(professorName));
          // Get.offAll(AdminDashBoardScreen());
          Get.offAll(SupervisorDashboardScreen());
        }
        else if (responseData["data"]["user"]["role"] == "admin") {
          appStorage.write(adminToken, responseData["data"]["token"]);
          appStorage.write(adminId, responseData["data"]["user"]["id"]);
          appStorage.write(adminName, responseData["data"]["user"]["name"]);
          print(appStorage.read(adminToken));
          print(appStorage.read(adminId));
          print(appStorage.read(adminName));
          Get.offAll(AdminDashBoardScreen());
        }
      }
    }
    else {
//       print(responseData);
//       print(responseData["message"]);
//       Map<String, dynamic> errorMap = responseData["error"];
//       print(errorMap);
//
// // Choose a key to display (e.g., the first key)
//       String firstErrorKey = errorMap.keys.first;
//       String errorMessage = errorMap[firstErrorKey];
//

      // Get.back();
      showInSnackBar("Invalid Email Password",
          color: AppColors.errorcolor);
      // print(
      //     "Sign In error: ${response.statusCode
      //         .toString()} ${responseData["message"]}");


      print("Response: ${response.body}");
    }
  } catch (error) {
    // Get.back();
    print("SignIn Error: $error");
    showInSnackBar(error.toString(), color: AppColors.errorcolor);
  }
}

registerUser(userModel userData) async {
  print(userData.email);
  showDialogue();


  try {
    final response = await http.post(Uri.parse(AppUrl.registerUrl), headers: {
      'Accept': 'application/json',
    }, body: {

      "name": userData.name,
      "university_id": userData.university_id,
      "email": userData.email,
      "password": userData.password,
      "role": userData.role
    });
    Get.back();
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    print(response.statusCode);


      if (responseData["success"] == true) {
        if (responseData["data"]["user"]["role"] == "student") {
          showInSnackBar("Student Registered Successfully");
          Get.offAll(StudentLoginScreen());
        }
        else if (responseData["data"]["user"]["role"] == "professor") {
          showInSnackBar("Supervisor Registered Successfully");
          Get.offAll(SupervisorLoginScreen());
        }
        else if (responseData["data"]["user"]["role"] == "admin") {

          Get.offAll(AdminLoginScreen());
        }
      }
    else {

      print("Sign Up error: ${response.statusCode}");
      print("Response: ${response.body}");

      showInSnackBar(responseData["message"], color: AppColors.errorcolor);
      // Get.back();
    }

  } catch (error) {
    print("Error: $error");
    showInSnackBar(error.toString(), color: AppColors.errorcolor);
    // Get.back();
  }
}

}
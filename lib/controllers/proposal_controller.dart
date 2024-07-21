import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smiu/components/colors.dart';
import 'package:smiu/local_storage/get_storage.dart';
import 'package:smiu/models/supervisor_model.dart';
import 'package:smiu/student_screens/AssignedSuperVisorScreen.dart';
import 'package:smiu/student_screens/professors.dart';
import 'package:smiu/student_screens/supervisorReviewScreen.dart';
import 'package:smiu/student_screens/supervisor_selection.dart';
import '../appUrls/appUrl.dart';
import '../global/alertbox.dart';
import '../global/custom_snackbar.dart';

class ProposalController extends GetxController {
  var supervisorList = <SupervisorModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSupervisor();
  }

  Future<void> getSupervisor() async {
    String currentToken = appStorage.read("studenttoken");
    print(currentToken);

    try {
      print(AppUrl.getsupervisorUrl);
      final response = await http.get(
        Uri.parse(AppUrl.getsupervisorUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer 11|zxIRb5ncfqcUGJ6pEpPRLNyZIuB0IvIFFY5C4TAJeba58305",
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> supervisorData = responseData['data']['supervisors'];
        supervisorList.assignAll(
          supervisorData.map((json) => SupervisorModel.fromJson(json)).toList(),
        );
        print(supervisorList);
      } else {
        throw Exception('Failed to fetch supervisors');
      }
    } catch (error) {
      print("Error: $error");
      // Handle error here if needed
    }
  }

  teamCheck() async {
    showDialogue();
    String currentToken = appStorage.read('studenttoken');
    print(currentToken);

    try {
      final response = await http.get(
        Uri.parse(AppUrl.teamCheckUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
      );

      Get.back(); // Close the dialogue after receiving the response
      print(response.statusCode);
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        if (responseData["success"] == true) {
          var teamData = responseData['data']['team'];
          if (teamData['supervisor_id'] == 0) {
            Get.to(SupervisorStatusScreen());
          } else if (teamData['approve'] == 1) {
            Get.to(SuperVisorAssignedScreen());
          } else {
            print("Navigating to supervisor");
            Get.to(SuperVisorSelection());
          }
        }
        if (responseData["success"] == false) {
          Get.to(SuperVisorSelection());
        }
      } else {

        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
        showInSnackBar(
          "Error ${response.statusCode} ${responseData['error']}",
          color: AppColors.errorcolor,
        );
      }
    } catch (error) {
      print("Error: $error");
      showInSnackBar(error.toString(), color: AppColors.errorcolor);
    }
  }



  sendProposal(Map<String, String> data) async {
    String currentToken = appStorage.read('studenttoken');
    print(currentToken);

    try {
      // Show dialogue
      showDialogue();
      print("Data to send: $data");

      final response = await http.post(
        Uri.parse(AppUrl.sendProposalUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
        body: data, // Send data as form-data
      );

      // Debug: print the status code and response body
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Close the dialog
      Get.back();

      // Parse the response body
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData["success"] == true) {
          showInSnackBar(responseData["message"], color: AppColors.primaryColor);
          print("Success: ${responseData["message"]}");
        } else {
          showInSnackBar(responseData['message'], color: AppColors.errorcolor);
          print("${responseData['message']}");
        }
      } else {
        showInSnackBar(responseData['message'], color: AppColors.errorcolor);
        print("${response.statusCode}: ${responseData['message']}");
      }
    } catch (error) {
      print("Error: $error");
      showInSnackBar(error.toString(), color: AppColors.errorcolor);
    } finally {
      // Ensure dialog is closed in case of an error
      Get.back();
    }
  }


  topicProposalSubmission(Map<String, dynamic> data) async {
    String currentToken = appStorage.read('studenttoken');
    print(currentToken);

    try {
      // Show dialogue
      showDialogue();
      print("Data to send: $data");

      final response = await http.post(
        Uri.parse(AppUrl.topicProposalUrl),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
        body: json.encode(data),
      );

      // Debug: print the status code and response body
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Close the dialog
      Get.back();

      // Parse the response body
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (responseData["success"] == true) {
          showInSnackBar(responseData["message"], color: AppColors.primaryColor);
          print("Success: ${responseData["message"]}");
        } else {
          showInSnackBar(responseData['message'], color: AppColors.errorcolor);
          print("Failed with success == false: ${responseData['message']}");
        }
      } else {
        showInSnackBar(responseData['message'], color: AppColors.errorcolor);
        print("Failed with status code ${response.statusCode}: ${responseData['message']}");
      }
    } catch (error) {
      print("Error: $error");
      showInSnackBar(error.toString(), color: AppColors.errorcolor);
    } finally {
      // Ensure dialog is closed in case of an error
      Get.back();
    }
  }

  ChangeSupervisor(String supervisor_id,String reason) async {
    showDialogue();
    String currentToken = appStorage.read('studenttoken');
    print(currentToken);

    try {
      final response = await http.post(
        Uri.parse(AppUrl.changeSupervisorUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
        body:{
          'supervisor_id':supervisor_id.toString(),
          'reason':reason
        }

      );

      Get.back(); // Close the dialogue after receiving the response
      print(response.statusCode);
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        print(responseData);
        showInSnackBar('Supervisor Change Request Submitted',color: AppColors.primaryColor);
        Get.back();


      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
        showInSnackBar(
          "Error ${response.statusCode} ${responseData['error']}",
          color: AppColors.errorcolor,
        );
      }
    } catch (error) {
      print("Error: $error");
      showInSnackBar(error.toString(), color: AppColors.errorcolor);
    }
  }
  String issuperstatus="";
  var isloading=false.obs;
  ChangeSupervisorStatus() async {
    // showDialogue();
    String currentToken = appStorage.read('studenttoken');
    print(currentToken);

    try {
      final response = await http.get(
          Uri.parse(AppUrl.changeSupervisorStatusUrl),
          headers: {
            'Accept': 'application/json',
            'Authorization': "Bearer $currentToken",
          },


      );

      // Get.back(); // Close the dialogue after receiving the response
      print(response.statusCode);
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        print(responseData);

        if(responseData['data']["sup_requests"]['accept']==1){
                    print('approve');
                    issuperstatus="approve";
          //
          //           // return;

        }
        else if(responseData['data']["sup_requests"]["status"]==1){
          print('progress');
          issuperstatus="progress";

        }
        else if(responseData['data']["sup_requests"]["accept"]==0){
          print('not approved');
          issuperstatus="not approve";
          // return;

        }

        isloading.value=false;

        // showInSnackBar('Supervisor Change Request Submitted',color: AppColors.primaryColor);
        // Get.back();


      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
        showInSnackBar(
          "Error ${response.statusCode} ${responseData['error']}",
          color: AppColors.errorcolor,
        );
      }
    } catch (error) {
      print("Error: $error");
      showInSnackBar(error.toString(), color: AppColors.errorcolor);
    }
  }





}


import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:smiu/components/colors.dart';
import 'package:smiu/local_storage/get_storage.dart';
import 'package:smiu/models/supervisor_model.dart';
import 'package:smiu/student_screens/supervisorReviewScreen.dart';
import 'package:smiu/student_screens/supervisor_selection.dart';
import '../appUrls/appUrl.dart';
import '../global/alertbox.dart';
import '../global/custom_snackbar.dart';
import '../models/requestmodel.dart';

class fypRequestController extends GetxController{

  var requestsList = <RequestModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getRequests();
  }
   var isgetting=false.obs;
   getRequests() async {
     isgetting.value=true;
     print("Getting Professors");
    String currentToken = appStorage.read(professorToken);
    print(currentToken);

    try {
      print(AppUrl.getRequestsUrl);
      final response = await http.get(
        Uri.parse(AppUrl.getRequestsUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        print(responseData);
        final List<dynamic> requestData = responseData['data']['requests'];
        requestsList.assignAll(
          requestData.map((json) => RequestModel.fromJson(json)).toList(),
        );
        print(requestsList);
        isgetting.value=false;
      } else {
        print(responseData);
        print(response.statusCode);
        isgetting.value=false;
        // throw Exception('Failed to fetch supervisors');
      }
    } catch (error) {
      isgetting.value=false;
      print("Error: $error");

      // Handle error here if needed
    }
  }
  acceptRequest(int requestId) async {
    showDialogue();
    print("Accepting request: $requestId");

    String? currentToken = appStorage.read(professorToken);


    String url = AppUrl.acceptRequestUrl+requestId.toString();
    print("URL: $url");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        Get.back();
        showInSnackBar("Request Accepted Successfuly",color: AppColors.primaryColor);
        
        print("Request accepted successfully.");
      } else {
        Get.back();
        print("Failed to accept request with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        throw Exception('Failed to accept request');
      }
    } catch (error) {
      Get.back();
      print("Error: $error");
      // Handle error here if needed
    }
  }
  var adminSuprequestList = <RequestModel>[].obs;

  adminSuperRequest() async {
    isgetting.value=true;
    print("Getting requests");
    String currentToken = appStorage.read(adminToken);
    // print(currentToken);

    try {

      final response = await http.get(
        Uri.parse(AppUrl.adminchangeSupervisor),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        print(responseData);
        final List<dynamic> requestData = responseData['data']['sup_requests'];
        adminSuprequestList.assignAll(
          requestData.map((json) => RequestModel.fromJson(json)).toList(),
        );
        print(adminSuprequestList);
        // print(requestsList);
        isgetting.value=false;
      } else {
        print(responseData);
        print(response.statusCode);
        isgetting.value=false;
        // throw Exception('Failed to fetch supervisors');
      }
    } catch (error) {
      isgetting.value=false;
      print("Error: $error");

      // Handle error here if needed
    }
  }

  adminRequestAcceptDecline(String id,String status) async {
    showDialogue();
    print("Getting requests");
    String currentToken = appStorage.read(adminToken);
    // print(currentToken);

    try {

      final response = await http.post(
        Uri.parse(AppUrl.supAcceptDeclineUrl+id),
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $currentToken",
        },
        body: {
          "accept":status
        }
      );

      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);

      if (response.statusCode == 200) {
        Get.back();
        print(responseData);
        showInSnackBar( status=="1"? "Request Accepted":"Request Declined",color: AppColors.primaryColor);
      
        // print(requestsList);
        
      } else {
        print(responseData);
        print(response.statusCode);

        // throw Exception('Failed to fetch supervisors');
      }
    } catch (error) {

      print("Error: $error");

      // Handle error here if needed
    }
  }



}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:smiu/models/progress%20model.dart';
import 'package:http/http.dart' as http;
import 'package:smiu/models/supervisor_model.dart';
import '../appUrls/appUrl.dart';
import '../local_storage/get_storage.dart';

class progressController extends GetxController{
  RxList<progressModel> studentProgressList = <progressModel>[

    progressModel(

        groupNumber: 1,
        topicName: "FYP Management System",
        progress: 8,
        attended: false

    ),
    progressModel(

        groupNumber: 1,
        topicName: "Food Delivery System",
        progress: 10,
        attended: false

    ),
    progressModel(

        groupNumber: 1,
        topicName: "Cab Booking",
        progress:4,
        attended: false

    ),
    progressModel(

        groupNumber: 1,
        topicName: "Hall Booking",
        progress: 1,
        attended: false

    ),

  ].obs;
  var professorsProfilesList = <SupervisorModel>[
   SupervisorModel(name:'Professor Ameen Khowaja',profile: 'https://www.smiu.edu.pk/themes/smiu/images/Mr%20Ameen%20Khowaja.jpg',description:'Mr. Ameen Khowaja obtained his MS degree in Computer Science and IT from Muhammad Ali Jinnah University, Karachi. He is a Ph.D. scholar and has over 20+ years of teaching, administration and research experience. He has published 03 research papers in HEC-recognized international journals. Mr Ameen Khowaja has supervised more than 30 undergraduates’ final year projects in the domain of Artificial Intelligence, Mobile Application development, IoT and Web developments. His research interests include Data Mining, Sentiment Analysis, Machine Learning, IoT, security and surveillance. He has honor to be the founder member of one of the highest bodies of SMIU’S Syndicate, member/secretary tender committee, member technical evaluation committee and focal person of SMIC in coordination with NDMA to represent SMIC in past. He is also trained and certified disaster management in the fields of Search and Rescue, Fire Fighting and First Aid.',role:'Assisstant Professor' ),
    SupervisorModel(name:'Professor Ameen Khowaja',profile: 'https://www.smiu.edu.pk/themes/smiu/images/Mr%20Ameen%20Khowaja.jpg',description:'Mr. Ameen Khowaja obtained his MS degree in Computer Science and IT from Muhammad Ali Jinnah University, Karachi. He is a Ph.D. scholar and has over 20+ years of teaching, administration and research experience. He has published 03 research papers in HEC-recognized international journals. Mr Ameen Khowaja has supervised more than 30 undergraduates’ final year projects in the domain of Artificial Intelligence, Mobile Application development, IoT and Web developments. His research interests include Data Mining, Sentiment Analysis, Machine Learning, IoT, security and surveillance. He has honor to be the founder member of one of the highest bodies of SMIU’S Syndicate, member/secretary tender committee, member technical evaluation committee and focal person of SMIC in coordination with NDMA to represent SMIC in past. He is also trained and certified disaster management in the fields of Search and Rescue, Fire Fighting and First Aid.',role:'Assisstant Professor' ),
    SupervisorModel(name:'Professor Ameen Khowaja',profile: 'https://www.smiu.edu.pk/themes/smiu/images/Mr%20Ameen%20Khowaja.jpg',description:'Mr. Ameen Khowaja obtained his MS degree in Computer Science and IT from Muhammad Ali Jinnah University, Karachi. He is a Ph.D. scholar and has over 20+ years of teaching, administration and research experience. He has published 03 research papers in HEC-recognized international journals. Mr Ameen Khowaja has supervised more than 30 undergraduates’ final year projects in the domain of Artificial Intelligence, Mobile Application development, IoT and Web developments. His research interests include Data Mining, Sentiment Analysis, Machine Learning, IoT, security and surveillance. He has honor to be the founder member of one of the highest bodies of SMIU’S Syndicate, member/secretary tender committee, member technical evaluation committee and focal person of SMIC in coordination with NDMA to represent SMIC in past. He is also trained and certified disaster management in the fields of Search and Rescue, Fire Fighting and First Aid.',role:'Assisstant Professor' ),
    SupervisorModel(name:'Professor Ameen Khowaja',profile: 'https://www.smiu.edu.pk/themes/smiu/images/Mr%20Ameen%20Khowaja.jpg',description:'Mr. Ameen Khowaja obtained his MS degree in Computer Science and IT from Muhammad Ali Jinnah University, Karachi. He is a Ph.D. scholar and has over 20+ years of teaching, administration and research experience. He has published 03 research papers in HEC-recognized international journals. Mr Ameen Khowaja has supervised more than 30 undergraduates’ final year projects in the domain of Artificial Intelligence, Mobile Application development, IoT and Web developments. His research interests include Data Mining, Sentiment Analysis, Machine Learning, IoT, security and surveillance. He has honor to be the founder member of one of the highest bodies of SMIU’S Syndicate, member/secretary tender committee, member technical evaluation committee and focal person of SMIC in coordination with NDMA to represent SMIC in past. He is also trained and certified disaster management in the fields of Search and Rescue, Fire Fighting and First Aid.',role:'Assisstant Professor' )

  ].obs;


  //
  // Future<void> getSupervisor() async {
  //   String currentToken = appStorage.read("studenttoken");
  //   print(currentToken);
  //
  //   try {
  //     print(AppUrl.getsupervisorUrl);
  //     final response = await http.get(
  //       Uri.parse(AppUrl.getsupervisorUrl),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': "Bearer $currentToken",
  //       },
  //     );
  //
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //     if (response.statusCode == 200) {
  //       final List<dynamic> supervisorData = responseData['data']['supervisors'];
  //       supervisorList.assignAll(
  //         supervisorData.map((json) => SupervisorModel.fromJson(json)).toList(),
  //       );
  //       print(supervisorList);
  //     } else {
  //       throw Exception('Failed to fetch supervisors');
  //     }
  //   } catch (error) {
  //     print("Error: $error");
  //     // Handle error here if needed
  //   }
  // }





}
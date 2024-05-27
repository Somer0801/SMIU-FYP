
import 'package:get/get.dart';
import 'package:smiu/models/meeting_model.dart';

class MeetingController extends GetxController{

  RxList<meetingModel> studentmeetingList = <meetingModel>[

    meetingModel(
      meeting_num: "1",
      professorName: "Prof Ameen Khowaja",
      meetingdate: "25-may-2024",
      attended: false

    ),
    meetingModel(
      meeting_num: "2",
      attended: true,
      professorName: "Prof Ameen Khowaja",
      meetingdate: "25-may-2024",

    ),
    meetingModel(
      meeting_num: "45",
      attended: true,
      professorName: "Prof Ameen Khowaja",
      meetingdate: "25-may-2024",

    ),
    meetingModel(
      meeting_num: "45",
      attended: true,
      professorName: "Prof Ameen Khowaja",
      meetingdate: "25-may-2024",

    ),
    meetingModel(
      meeting_num: "45",
      attended: true,
      professorName: "Prof Ameen Khowaja",
      meetingdate: "25-may-2024",

    )
  ].obs;



}
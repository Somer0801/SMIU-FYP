import 'package:get/get.dart';
import 'package:smiu/models/progress%20model.dart';

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



}
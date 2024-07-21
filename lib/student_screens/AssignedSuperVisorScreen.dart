import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
import '../controllers/proposal_controller.dart';
import '../models/supervisor_model.dart';

class SuperVisorAssignedScreen extends StatefulWidget {
  const SuperVisorAssignedScreen({Key? key}) : super(key: key);

  @override
  State<SuperVisorAssignedScreen> createState() =>
      _SuperVisorAssignedScreenState();
}

class _SuperVisorAssignedScreenState extends State<SuperVisorAssignedScreen> {
  ProposalController controller = Get.put(ProposalController());
  SupervisorModel? selectedFirstSupervisor;
  TextEditingController reasonController=TextEditingController();

  @override
  void initState() {
    controller.getSupervisor();
    controller.ChangeSupervisorStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Container(
                height: Get.height * 0.17,
                width: Get.width * 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.smiulogo),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(StudentDashboardScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.primaryColor,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Text(
              "SuperVisorProfile",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
                letterSpacing: 1.2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5, top: 50),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    Center(
                      child: Text(
                        "Assigned Supervisor Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Wrap(
                              children: [
                                Center(
                                  child: Container(
                                    height: Get.height * 0.2,
                                    width: Get.width * 0.75,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://picsum.photos/id/237/200/300'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Lorem Ipsum Dummy Text'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.1),
             Obx(() =>    controller.isloading.value?CircularProgressIndicator(color: AppColors.primaryColor,):controller.issuperstatus=="not approve"? Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('Request For Assigning New Supervisor is decline by the Coordinator kindly continue with the assigned supervisor',textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),),
             ):controller.issuperstatus=="approve"? Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('Request For Assigning New Supervisor has been Approved',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
             ): controller.issuperstatus=="progress"? Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text('Your Request for Assigning the new Supervisor is in Progress!',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
             ):GestureDetector(
               onTap: () {
                 _showDetailsDialog(context);
               },
               child: Container(
                 height: Get.height * 0.05,
                 width: Get.width * 0.45,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: AppColors.primaryColor,
                 ),
                 child: Center(
                   child: Text(
                     'Change Supervisor',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 15,
                       fontWeight: FontWeight.w700,
                     ),
                   ),
                 ),
               ),
             ),)
          ],
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: Get.height * 0.65,
                width: Get.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: AppColors.primaryColor,
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter Reason To Change Supervisor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextField(
                      controller: reasonController,
                      minLines: 4,
                      maxLines: 6,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Reason',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Select New Preferred Supervisor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: Get.height*0.05,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color of the dropdown field
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey), // Border color of the dropdown field
                      ),
                      child: DropdownButton<SupervisorModel>(
                        hint: Text('Select Preferred Supervisor'),
                        value: selectedFirstSupervisor,
                        dropdownColor: Colors.white, // Dropdown menu background color
                        iconEnabledColor: Colors.black, // Icon color
                        onChanged: (SupervisorModel? newValue) {
                          setState(() {
                            selectedFirstSupervisor = newValue;
                          });
                        },
                        items: controller.supervisorList
                            .map((SupervisorModel supervisor) {
                          return DropdownMenuItem<SupervisorModel>(
                            value: supervisor,
                            child: Text(supervisor.name!),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height:Get.height*0.05),
                    GestureDetector(
                      onTap: (){
                        print(selectedFirstSupervisor?.id.toString() ?? '');
                        controller.ChangeSupervisor(selectedFirstSupervisor?.id.toString() ?? '',reasonController.text );
                      },
                      child: Container(
                        height: Get.height * 0.05,
                        width: Get.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/customstudent.dart';
import 'package:smiu/components/dashbardTile.dart';
import 'package:smiu/components/supervisor_fields.dart';
import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/controllers/proposal_controller.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/global/custom_snackbar.dart';
import 'package:smiu/local_storage/get_storage.dart';
import 'package:smiu/models/supervisor_model.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/student_dashboard.dart';

class SuperVisorSelection extends StatefulWidget {
  const SuperVisorSelection({Key? key}) : super(key: key);

  @override
  State<SuperVisorSelection> createState() => _SuperVisorSelectionState();
}

class _SuperVisorSelectionState extends State<SuperVisorSelection> {
  ProposalController controller = Get.put(ProposalController());
  TextEditingController project1Controller = TextEditingController();
  TextEditingController project2Controller = TextEditingController();
  TextEditingController project3Controller = TextEditingController();
  TextEditingController supercisor1Controller = TextEditingController();
  TextEditingController supervisor2Controller = TextEditingController();
  TextEditingController supervisor3Controller = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  TextEditingController name3Controller = TextEditingController();
  TextEditingController id1Controller = TextEditingController();
  TextEditingController id2Controller = TextEditingController();
  TextEditingController id3Controller = TextEditingController();
  TextEditingController email1Controller1 = TextEditingController();
  TextEditingController email1Controller2 = TextEditingController();
  TextEditingController email1Controller3 = TextEditingController();

  SupervisorModel? selectedFirstSupervisor;
  SupervisorModel? selectedSecondSupervisor;
  SupervisorModel? selectedThirdSupervisor;

  @override
  void initState() {
    controller.getSupervisor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.95,
                    color: Colors.transparent,
                  ),
                  Container(
                    height: Get.height * 0.25,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.dashboardtop),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(StudentDashboardScreen());
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                              Text(
                                "Supervisor Selection",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  appStorage.erase();
                                },
                                child: Container(
                                  height: Get.height * 0.08,
                                  width: Get.width * 0.1,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(AppAssets.logout),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 88,
                    left: 2,
                    right: 2,
                    child: Center(
                      child: Container(
                        height: Get.height * 0.8,
                        width: Get.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.tileColor,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "First Supervisor:",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                        () {
                                      return DropdownButton<SupervisorModel>(
                                        hint: Center(child: Text('Select First Supervisor')),
                                        value: selectedFirstSupervisor,
                                        onChanged: (SupervisorModel? newValue) {
                                          setState(() {
                                            selectedFirstSupervisor = newValue;
                                          });
                                        },
                                        items: controller.supervisorList
                                            .map((SupervisorModel supervisor) {
                                          return DropdownMenuItem<SupervisorModel>(
                                            value: supervisor,
                                            child: Center(child: Text(supervisor.name!)),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Second Supervisor:",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                        () {
                                      return DropdownButton<SupervisorModel>(
                                        hint: Center(child: Text('Select Second Supervisor')),
                                        value: selectedSecondSupervisor,
                                        onChanged: (SupervisorModel? newValue) {
                                          setState(() {
                                            selectedSecondSupervisor = newValue;
                                          });
                                        },
                                        items: controller.supervisorList
                                            .map((SupervisorModel supervisor) {
                                          return DropdownMenuItem<SupervisorModel>(
                                            value: supervisor,
                                            child: Center(child: Text(supervisor.name!)),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Third Supervisor:",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                        () {
                                      return DropdownButton<SupervisorModel>(
                                        hint: Text('Select Third Supervisor'),
                                        value: selectedThirdSupervisor,
                                        onChanged: (SupervisorModel? newValue) {
                                          setState(() {
                                            selectedThirdSupervisor = newValue;
                                          });
                                        },
                                        items: controller.supervisorList
                                            .map((SupervisorModel supervisor) {
                                          return DropdownMenuItem<SupervisorModel>(
                                            value: supervisor,
                                            child: Text(supervisor.name!),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Project Topic-1:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "Project 1",
                              //       controller: project1Controller,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Project Topic-2:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "project 2",
                              //       controller: project2Controller,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Project Topic-3:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "project 3",
                              //       controller: project3Controller,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Member Name-1:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "Name member 1",
                              //       controller: name1Controller,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Member ID-1:",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SupervisorFields(
                                    hinttext: "Roll #",
                                    controller: id1Controller,
                                    showSuffixIcon: false,
                                  )
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Member Email-1:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "Email",
                              //       controller: email1Controller1,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Member Name-2:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "Name member 2",
                              //       controller: name2Controller,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Member ID-2:",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SupervisorFields(
                                    hinttext: "2nd Roll #",
                                    controller: id2Controller,
                                    showSuffixIcon: false,
                                  )
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Member Email-2:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "memeber-2 email",
                              //       controller: email1Controller2,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Member Name-3:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "Member 3 name",
                              //       controller: name3Controller,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      "Member ID-3:",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SupervisorFields(
                                    hinttext: "3rd Roll #",
                                    controller: id3Controller,
                                    showSuffixIcon: false,
                                  )
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 15),
                              //       child: Text(
                              //         "Member Email-3:",
                              //         style: TextStyle(
                              //           color: AppColors.primaryColor,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //       ),
                              //     ),
                              //     SupervisorFields(
                              //       hinttext: "email member 3",
                              //       controller: email1Controller3,
                              //       showSuffixIcon: false,
                              //     )
                              //   ],
                              // ),
                              SizedBox(height: Get.height * 0.05),
                              GestureDetector(
                                onTap: (){
                                  // String sup1Id = (selectedFirstSupervisor?.id ?? '').toString();
                                  // String sup2Id = (selectedSecondSupervisor?.id ?? '').toString();
                                  // String sup3Id = (selectedThirdSupervisor?.id ?? '').toString();
                                  // String topic1 = project1Controller.text ?? '';
                                  // String topic2 = project2Controller.text ?? '';

                                  if(id1Controller.text.isNotEmpty&& id2Controller.text.isNotEmpty&&id3Controller.text.isNotEmpty&&
                                      selectedFirstSupervisor != null &&
                                      selectedSecondSupervisor != null &&
                                      selectedThirdSupervisor != null
                                  ){
                                    // String topic3 = project3Controller.text ?? '';
                                    Map<String, String> data = {
                                      'user_id1': id1Controller.text.toString(),
                                      'user_id2':id2Controller.text.toString(),
                                      'user_id3':id3Controller.text.toString(),




                                      "sup_1": selectedFirstSupervisor!.id.toString(),
                                      "sup_2": selectedSecondSupervisor!.id.toString(),
                                      "sup_3": selectedThirdSupervisor!.id.toString()

                                    };
                                    print(data);
                                    controller.sendProposal(data);
                                  }
                                  else{
                                    showInSnackBar('Fill All the fields',color: AppColors.errorcolor);
                                  }

                                  // Call the sendProposal method from the controller to send the data

                                },
                                child: Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.3,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.02),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

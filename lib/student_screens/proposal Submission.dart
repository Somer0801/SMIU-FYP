import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/customstudent.dart';
import 'package:smiu/components/dashbardTile.dart';
import 'package:smiu/components/sumssion_fields.dart';
import 'package:smiu/components/supervisor_fields.dart';

import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/controllers/proposal_controller.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/global/custom_snackbar.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
class ProposalSubmission extends StatefulWidget {
  const ProposalSubmission({Key? key}) : super(key: key);

  @override
  State<ProposalSubmission> createState() => _ProposalSubmissionState();
}

class _ProposalSubmissionState extends State<ProposalSubmission> {
  ProposalController controller =Get.put(ProposalController());
  TextEditingController project1Controller=TextEditingController();
  TextEditingController project2Controller=TextEditingController();
  TextEditingController project3Controller=TextEditingController();
  TextEditingController supervisor1Controller=TextEditingController();
  TextEditingController supervisor2Controller=TextEditingController();
  TextEditingController supervisor3Controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(





        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: Get.height*0.17,
                  width: Get.width*1,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAssets.smiulogo),fit: BoxFit.cover)
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: (){
                          Get.to(StudentDashboardScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Icon(Icons.arrow_back_ios_new,color:AppColors.primaryColor,size: 35,),
                        )),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.03),
              Text("Proposal Submisison",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
              SizedBox(height: Get.height*0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Project Topic-1:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SubmissionFields(hinttext: "Project Topic-1", controller:supervisor1Controller,showSuffixIcon: false,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Description-1",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SubmissionFields(hinttext: "Description of topic-1", controller:project1Controller,showSuffixIcon: false,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Project Topic-2:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SubmissionFields(hinttext: "Project Topic-2", controller:supervisor2Controller,showSuffixIcon: false,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Description-2:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SubmissionFields(hinttext: "Description of topic-2", controller:project2Controller,showSuffixIcon: false,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Project Topic-3:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SubmissionFields(hinttext: "Project Topic-3", controller:supervisor3Controller,showSuffixIcon: false,)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text("Description-3:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SubmissionFields(hinttext: "Description Topic-3", controller:project3Controller,showSuffixIcon: false,)
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(" Upload Poposal File",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                  ),
                  SizedBox(height:Get.height*0.12),
                  Container(height: Get.height*0.05,width: Get.width*0.3,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text(".docx",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700,letterSpacing: 1.25),)),
                  ),




                ],
              ),
              SizedBox(height: Get.height*0.0),
              GestureDetector(
                onTap:(){
                  Map<String, dynamic> data = {
                    'topic_1':supervisor1Controller.text,
                    'topic_2':supervisor2Controller.text ,
                    'topic_3':supervisor3Controller.text,
                    'session':"Spring-2024",
                    'date':DateTime.now().toString(),




                    "description_1":project1Controller.text ,
                    "description_2":project2Controller.text ,
                    "description_3":project3Controller.text,

                  };
                  if(supervisor1Controller.text.isNotEmpty&&supervisor2Controller.text.isNotEmpty&&supervisor3Controller.text.isNotEmpty&&project1Controller.text.isNotEmpty&&project2Controller.text.isNotEmpty&&project3Controller.text.isNotEmpty){
                    controller.topicProposalSubmission(data);
                  }
                  else{
                    showInSnackBar("Fill all The fields",color: AppColors.errorcolor);
                  }



                },

                  child: CustomButton(text: "Submit"))







            ],
          ),
        ) ,
      ),
    );
  }
}

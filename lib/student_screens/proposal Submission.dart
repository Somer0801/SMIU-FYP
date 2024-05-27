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
import 'package:smiu/dashboard.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/student_screens/student_dashboard.dart';
class ProposalSubmission extends StatefulWidget {
  const ProposalSubmission({Key? key}) : super(key: key);

  @override
  State<ProposalSubmission> createState() => _ProposalSubmissionState();
}

class _ProposalSubmissionState extends State<ProposalSubmission> {
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
        body:Column(
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
                  child: Text("Project Title:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                ),
                SubmissionFields(hinttext: "Project title", controller:supervisor1Controller,showSuffixIcon: false,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("Member-1 ID:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                ),
                SubmissionFields(hinttext: "Enter ID memebr 1", controller:supervisor1Controller,showSuffixIcon: false,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("Member-2 ID:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                ),
                SubmissionFields(hinttext: "Enter ID memebr 2", controller:supervisor1Controller,showSuffixIcon: false,)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text("Member-3 ID:",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight:FontWeight.w500),),
                ),
                SubmissionFields(hinttext: "Enter ID member 3", controller:supervisor1Controller,showSuffixIcon: false,)
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
            SizedBox(height: Get.height*0.07),
            CustomButton(text: "Sign In", tap:(){Get.to(DashBoardScreen());} )







          ],
        ) ,
      ),
    );
  }
}

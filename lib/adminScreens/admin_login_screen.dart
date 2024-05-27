import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/adminScreens/admin_dashborad_screen.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/student_screens/studentRegistration.dart';
import 'package:smiu/supervisorScreens/supervisor_dashboard.dart';
import 'package:smiu/supervisorScreens/supervisor_registration.dart';

import '../components/colors.dart';
import '../controllers/auth_Controller.dart';
import '../global/custom_snackbar.dart';
import '../models/user_model.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  AuthController contoller =Get.put(AuthController());
  TextEditingController rollnumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(

            children: [
              Container(
                height: Get.height*0.3,
                width: Get.width*1,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAssets.top),fit: BoxFit.fill)
                ),
                child: Column(
                  children: [
                    Align(
                      alignment:Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 35,left: 15),
                        child: GestureDetector(
                            onTap: (){
                              Get.to(DashBoardScreen());
                            },
                            child: Icon(Icons.arrow_back_ios_new,color:Colors.white,size: 40,)),
                      ),
                    ),
                    Container(
                      height: Get.height*0.2,
                      width: Get.width*1,

                      decoration: BoxDecoration(
                          color: Colors.transparent,

                          image: DecorationImage(image: AssetImage(AppAssets.smiulogo),fit: BoxFit.cover)
                      ),
                    )
                    // CircleAvatar(
                    //   radius: 70,
                    //   backgroundImage: AssetImage(AppAssets.profile),
                    // )
                  ],
                ),
              ),
              SizedBox(height: Get.height*0.02,),
              Center(child: TextStyling(text:"Sign In As Coordinator ")),
              SizedBox(height: Get.height*0.02,),

              CustomTextField(hinttext:"Enter Roll Number", controller: rollnumberController,showSuffixIcon: false,),

              CustomTextField(hinttext:"Enter Password", controller: passwordController,showSuffixIcon: true,),
              SizedBox(height: Get.height*0.05,),
              CustomButton(text: "Sign In", tap:(){
                if (rollnumberController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  contoller.signInUser(userModel(
                      role: "admin",
                      name: rollnumberController.text,
                      password: passwordController.text));
                }
                else if(rollnumberController.text.isEmpty){
                  showInSnackBar("Enter Your Admin ID",color: AppColors.errorcolor);
                }
                else{
                  showInSnackBar("Enter Your Password",color: AppColors.errorcolor);
                }
                Get.to(AdminDashBoardScreen());} ),
              SizedBox(height: Get.height*0.035),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Don't have an Account?",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                    SizedBox(width: Get.width*0.02,),
                    GestureDetector(
                        onTap: (){
                          Get.to(SupervisorRegisterScreen());
                        },
                        child: Text("Sign Up",style: TextStyle(color:Color(0xff32225D),fontSize: 17,fontWeight: FontWeight.w600 ),))


                  ],),
              )


            ],
          ),
        ),
      ),
    );
  }
}

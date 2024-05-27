import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/colors.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/global/custom_snackbar.dart';
import 'package:smiu/student_screens/studentlogin.dart';
import 'package:smiu/supervisorScreens/supervsior_login.dart';

import '../controllers/auth_Controller.dart';
import '../models/user_model.dart';

class SupervisorRegisterScreen extends StatefulWidget {
  const SupervisorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<SupervisorRegisterScreen> createState() => _SupervisorRegisterScreenState();
}

class _SupervisorRegisterScreenState extends State<SupervisorRegisterScreen> {
  final _emailValidator = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController rollnumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  AuthController contoller =Get.put(AuthController());


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
                            onTap:(){ Get.to(SupervisorLoginScreen());},
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
              Center(child: TextStyling(text:"Resgister As Supervisor ")),
              CustomTextField(hinttext:"Enter Full Name", controller: nameController,showSuffixIcon: false,),
              CustomTextField(hinttext:"Enter Supervisor ID", controller: rollnumberController,showSuffixIcon: false,),
              CustomTextField(hinttext:"Enter Email", controller: emailController,showSuffixIcon: false,),
              CustomTextField(hinttext:"Enter Password", controller: passwordController,showSuffixIcon: true,),
              SizedBox(height: Get.height*0.05,),
              CustomButton(
                text: "Sign Up",
                tap: () {
                  if (nameController.text.isEmpty) {
                    print("Name is empty");
                    showInSnackBar("Enter Your Name", color: AppColors.errorcolor);
                  } else if (rollnumberController.text.isEmpty) {
                    print("Roll number is empty");
                    showInSnackBar("Enter Your Supervisor ID", color: AppColors.errorcolor);
                  } else if (emailController.text.isEmpty) {
                    print("Email is empty");
                    showInSnackBar("Enter Your Email", color: AppColors.errorcolor);
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(emailController.text)) {
                    print("Invalid email format");
                    showInSnackBar("Enter a valid email address", color: AppColors.errorcolor);
                  } else if (passwordController.text.isEmpty) {
                    print("Password is empty");
                    showInSnackBar("Enter Your Password", color: AppColors.errorcolor);
                  } else if (passwordController.text.length <= 6) {
                    print("Password length is less than 6");
                    showInSnackBar("Password must be at least 6 characters long", color: AppColors.errorcolor);
                  } else {
                    print("Registering user...");
                    contoller.registerUser(
                      userModel(
                        role: "professor",
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        university_id: rollnumberController.text,
                      ),
                    );
                  }
                },
              ),



              SizedBox(height: Get.height*0.035),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("Already have an Account?",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                    SizedBox(width: Get.width*0.02,),
                    GestureDetector(
                        onTap: (){
                          Get.to(SupervisorLoginScreen());
                        },
                        child: Text("Sign in",style: TextStyle(color:Color(0xff32225D),fontSize: 17,fontWeight: FontWeight.w600 ),))


                  ],),
              )


            ],
          ),
        ),
      ),
    );
  }
}

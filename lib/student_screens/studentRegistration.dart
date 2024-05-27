import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/components/appAssets.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/textfield.dart';
import 'package:smiu/components/textstyle.dart';
import 'package:smiu/controllers/auth_Controller.dart';
import 'package:smiu/dashboard.dart';
import 'package:smiu/models/user_model.dart';
import 'package:smiu/student_screens/studentlogin.dart';

import '../components/colors.dart';
import '../global/custom_snackbar.dart';

class StudentRegisterScreen extends StatefulWidget {
  const StudentRegisterScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegisterScreen> createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  AuthController contoller =Get.put(AuthController());
  final _emailValidator = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
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
                          onTap:(){ Get.to(StudentLoginScreen());},
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
             Center(child: TextStyling(text:"Resgister As Student ")),
              CustomTextField(hinttext:"Enter Full Name", controller: nameController,showSuffixIcon: false,),
              CustomTextField(hinttext:"Enter Roll Number", controller: rollnumberController,showSuffixIcon: false,),
              CustomTextField(hinttext:"Enter Email", controller: emailController,showSuffixIcon: false,),
              CustomTextField(hinttext:"Enter Password", controller: passwordController,showSuffixIcon: true,),
              SizedBox(height: Get.height*0.05,),
              CustomButton(text: "Sign Up", tap:(){
                if(nameController.text.isNotEmpty && rollnumberController.text.isNotEmpty &&
                    emailController.text.isNotEmpty && passwordController.text.isNotEmpty&&passwordController.text.length>=6&&!_emailValidator.hasMatch(emailController.text) ){
                  contoller.registerUser(userModel(role: "student",name: nameController.text,email: emailController.text,
                      password: passwordController.text,university_id: rollnumberController.text)
                  );


                }
                else if(nameController.text.isEmpty){
                  showInSnackBar("Enter Your Name",color:AppColors.errorcolor);
                }
                else if(rollnumberController.text.isEmpty){
                  showInSnackBar("Enter Your Roll number",color:AppColors.errorcolor);
                }
                else if(emailController.text.isEmpty){
                  showInSnackBar("Enter Your Email ",color:AppColors.errorcolor);
                }
                else if (!_emailValidator.hasMatch(emailController.text)) {
                  showInSnackBar("Enter a valid email address", color: AppColors.errorcolor);
                }
                else if(passwordController.text.length<6){
                  showInSnackBar("Password Should be greater than 6 ",color:AppColors.errorcolor);
                }
                else if(passwordController.text.isEmpty){
                  showInSnackBar("Enter Your Password",color:AppColors.errorcolor);
                }

                } ),
              SizedBox(height: Get.height*0.035),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Text("Already have an Account?",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),),
                  SizedBox(width: Get.width*0.02,),
                  GestureDetector(
                    onTap: (){


                      // Get.to(StudentLoginScreen());
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

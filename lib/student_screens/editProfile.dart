
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smiu/components/custom_button.dart';
import 'package:smiu/components/textfield.dart';
import 'package:smiu/local_storage/get_storage.dart';
import 'package:smiu/student_screens/student_dashboard.dart';

import '../components/appAssets.dart';
import '../components/colors.dart';
import '../controllers/profileController.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  ProfileController controller = Get.put(ProfileController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();
  final TextEditingController profileImgController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    Get.delete<ProfileController>();
    // TODO: implement dispose

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              Text("Edit Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:AppColors.primaryColor,letterSpacing: 1.2),),
          
              Stack(
                children: [
                  Obx(() =>  CircleAvatar(
                    radius: Get.height*0.09,
                    backgroundColor: Colors.transparent,
                    backgroundImage: controller.image.value !=
                        null
                        ? Image.file(controller.image.value!)
                        .image: AssetImage(AppAssets.profile)
                    // child:   Image.asset(AppAssets.profile),
                  
                    
                  ),),
                  Positioned(
                    right: 1,bottom: 15,
                    child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                      onTap: (){
                        controller.pickImage();
                      },
                        child: Icon(Icons.edit,color: AppColors.primaryColor,size: 40,)),
                  )
                  
                ],
              ),
              
              CustomTextField(hinttext: 'Name', controller: nameController,showSuffixIcon: false,),
              CustomTextField(hinttext: 'Roll Number', controller: rollNumberController,showSuffixIcon: false,),
              CustomTextField(hinttext: 'Department', controller: departmentController,showSuffixIcon: false,),
              CustomTextField(hinttext: 'FYP Session', controller: departmentController,showSuffixIcon: false,),
              CustomTextField(hinttext: 'Email', controller: emailController,showSuffixIcon: false,),
              SizedBox(height: Get.height*0.05,),

              CustomButton(text: 'Update'),
              SizedBox(height: Get.height*0.05,),
              
              
            ],
          ),
        ),
      ),
    );
  }
}

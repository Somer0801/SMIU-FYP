import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiu/SplashScreen.dart';
import 'package:smiu/components/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;

  final bool
  showSuffixIcon;

  CustomTextField({
    required this.hinttext,
    required this.controller,


    this.showSuffixIcon = true,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22),
      child: TextFormField(

        controller: widget.controller,
        obscureText: widget.showSuffixIcon ? _isObscure : false,
        textAlign: TextAlign.start,
        cursorColor: AppColors.primaryColor,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 26),
          filled: true,
          fillColor: AppColors.primaryColor.withOpacity(0.1),
               // You can replace it with Customitems.textfieldcolor
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryColor),

          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryColor),
          ),
          hintText: widget.hinttext,
          focusColor: AppColors.primaryColor,
          hintStyle: TextStyle(
            fontSize: 17,
            color: AppColors.primaryColor.withOpacity(0.67),
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: widget.showSuffixIcon
              ? IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          )


              : null,
          constraints: BoxConstraints(maxHeight: Get.height*0.066,maxWidth: Get.width*0.85)
          // Show suffix icon only if showSuffixIcon is true
        ),


      ),
    );
  }
}

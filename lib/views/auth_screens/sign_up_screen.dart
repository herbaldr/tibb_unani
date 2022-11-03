import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textfield_input_decorations.dart';
import '../home_page_screen.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool obsecurePass = true;
  final _formKey = GlobalKey<FormState>();

  // text field state

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Container(
        height: Get.height,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // SizedBox(height: Get.height*0.4)
              SvgPicture.asset(
                "assets/svg_icons/mortar_pestle.svg",
                height: Get.height*0.28,
                color: appWhiteColor,
              ),
              SizedBox(height: Get.height*0.04),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: textInputDecoration.copyWith(
                    hintText: 'First Name',
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your first name';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  firstName = val!;
                  setState(() {
                  });
                },
              ),
              SizedBox(height: 18.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Last Name',
                ),
                onSaved: (val) {
                  lastName = val!;
                  setState(() {
                  });
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your last name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 18.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: textInputDecoration.copyWith(
                    hintText: 'email',
                    suffixIcon: Icon(Icons.email_outlined)
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter Email';
                  }
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val) ){
                    return 'Please enter valid Email';
                  } else {
                    return null;
                  }
                },
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 18.0),
              TextFormField(
                obscureText: obsecurePass,
                decoration: textInputDecoration.copyWith(
                    hintText: 'password',
                    suffixIcon: InkWell(
                        onTap: _obSecureText,
                        child: Icon(Icons.remove_red_eye_outlined)
                    )
                ),
                onSaved: (val) {
                  password = val!;
                  setState(() {
                  });
                },
                validator: (val) {
                  RegExp regex = new RegExp(r'^.{6,}$');
                  if (val!.isEmpty) {
                    return ("Password is required for sign in");
                  }
                  if (!regex.hasMatch(val)) {
                    return ("Enter Valid Password(Min. 6 Character)");
                  }
                },
              ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    Get.to(HomePageScreen());
                  }
                },
                child: CustomButton(
                  height: Get.height*.06,
                  width: Get.width*0.4,
                  buttonText: "Sign Up",
                  color: secondaryColor,
                ),
              ),
              SizedBox(
                height: Get.height*0.09,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account !  ",
                    style: TextStyle(
                        color: textWhiteColor
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        Get.offAll(SignInScreen());
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: secondaryColor
                        ),
                      )
                  ),
                  SizedBox(
                    height: Get.height*0.07,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _obSecureText(){
    obsecurePass = !obsecurePass;
    setState(() {});
  }
}

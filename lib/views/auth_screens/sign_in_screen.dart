import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../services/auth_services.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textfield_input_decorations.dart';
import '../home_page_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final AuthService _auth = AuthService();

  bool obsecurePass = true;
  final _formKey = GlobalKey<FormState>();

  // text field state
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
                height: Get.height*0.3,
                color: appWhiteColor,
              ),
              SizedBox(height: Get.height*0.1),
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
                onTap: () async {
                  if(_formKey.currentState!.validate()){
                    Get.to(HomePageScreen());
                  }
                },
                child: CustomButton(
                  height: Get.height*.06,
                  width: Get.width*0.4,
                  buttonText: "Sign In",
                  color: secondaryColor,
                ),
              ),
              SizedBox(
                height: Get.height*0.2,
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
                      Get.offAll(SignUpScreen());
                    },
                    child: Text(
                      "Sign Up",
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

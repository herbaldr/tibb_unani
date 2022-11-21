import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../utils/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textfield_input_decorations.dart';
import '../screen_navigation.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  bool obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        height: Get.height,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  "assets/svg_icons/mortar_pestle.svg",
                  height: Get.height*0.2,
                  color: appWhiteColor,
                ),
                SizedBox(height: Get.height*0.07),
                // First name field...
                TextFormField(
                  controller: _firstName,
                  keyboardType: TextInputType.name,
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
                    setState(() {
                      _firstName = val! as TextEditingController;
                    });
                  },
                ),
                SizedBox(height: 18.0),
                // Last name field...
                TextFormField(
                  controller: _lastName,
                  keyboardType: TextInputType.name,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Last Name',
                  ),
                  onSaved: (val) {
                    setState(() {
                      _lastName = val! as TextEditingController;
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
                // Email field...
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Email',
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
                  onSaved: (val) {
                    setState(() => _email = val as TextEditingController);
                  },
                ),
                SizedBox(height: 18.0),
                // Password field...
                TextFormField(
                  controller: _password,
                  obscureText: obsecurePass,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Password',
                      suffixIcon: InkWell(
                          onTap: _obSecureText,
                          child: Icon(Icons.remove_red_eye_outlined)
                      )
                  ),
                  onSaved: (val) {
                    setState(() {
                      _password = val! as TextEditingController;
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
                SizedBox(height: 18.0),
                // Confrim Password field...
                TextFormField(
                  controller: _confirmPassword,
                  obscureText: obsecurePass,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Confirm Password',
                      suffixIcon: InkWell(
                          onTap: _obSecureText,
                          child: Icon(Icons.remove_red_eye_outlined)
                      )
                  ),
                  onSaved: (val) {
                    setState(() {
                      _confirmPassword = val! as TextEditingController;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return ("Re-enter your Password");
                    }
                    if (_confirmPassword.text !=
                        _password.text) {
                      return "Password don't match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: (){
                    // signUp(_email.text, _passWord.text);
                    if(_formKey.currentState!.validate())
                    {
                      _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text)
                          .then((value) =>
                      {
                        postDetailsToFirestore()
                      }).catchError((e)
                      {
                        Fluttertoast.showToast(msg: e!.message);
                      });
                    }
                  },
                  child: CustomButton(
                    height: Get.height*.06,
                    width: Get.width*0.4,
                    buttonText: "Sign Up",
                    color: secondaryColor,
                  ),
                ),
                SizedBox(height: Get.height*0.14),
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
                      height: Get.height*0.1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Secure password from other eyes...
  _obSecureText(){
    obsecurePass = !obsecurePass;
    setState(() {});
  }

  // saving user data to fire store
  postDetailsToFirestore() async {
    // calling our firestore

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;

    // calling our user model
    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = _firstName.text;
    userModel.lastName = _lastName.text;
    userModel.password = _password.text;

    // sending these values
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
    Get.to(ScreenNavigation());
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/common_utils.dart';
import 'package:task/utils/images.dart';
import 'package:task/utils/strings.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  final regexPassword = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.buttonColor,
      appBar: AppBar(
        backgroundColor: AppColor.buttonColor,
        automaticallyImplyLeading: false,
        title: const Text("Shien",
            style: TextStyle(fontSize: 25.0, color: Colors.white)),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 10.0,
            right: 0,
            left: 0,
            child: Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                        left: 0,
                        child: Image.asset(AppImage.signUpImage, fit: BoxFit.cover)),
                    const Positioned(
                      left: 10.0,
                      top: 20.0,
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontSize: 20.0, color: AppColor.buttonColor)),
                    ),
                    const Positioned(
                      left: 10.0,
                      top: 60.0,
                      child: Text("Welcome Back!",
                          style:
                              TextStyle(fontSize: 14.0, color: Colors.black)),
                    ),
                    const Positioned(
                      left: 10.0,
                      top: 80.0,
                      child: Text("Create New Account",
                          style:
                              TextStyle(fontSize: 22.0, color: Colors.black)),
                    ),
                  ],
                )),
          ),
          Positioned(
            top: 230,
            right: 0,
            left: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Please sign Up",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black)),
                      Text("Sign In",
                          style: TextStyle(
                              fontSize: 14.0, color: AppColor.buttonColor)),
                    ],
                  ),
                  TextField(
                    controller: nameController,
                    cursorColor: AppColor.buttonColor,
                    style: const TextStyle(color: AppColor.textColor),
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      labelStyle: TextStyle(color: AppColor.textColor),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.buttonColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: emailController,
                    cursorColor: AppColor.buttonColor,
                    style: const TextStyle(color: AppColor.textColor),
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      labelStyle: TextStyle(color: AppColor.textColor),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.buttonColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: passwordController,
                    cursorColor: AppColor.buttonColor,
                    style: const TextStyle(color: AppColor.textColor),
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      labelStyle: TextStyle(color: AppColor.textColor),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.buttonColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text("Terms and Conditions",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: AppColor.buttonColor,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10.0,
        shadowColor: Colors.black,
        child: SizedBox(
            height: 80.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        const MaterialStatePropertyAll(Size(150.0, 50.0)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColor.buttonColor)),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    CommonUtils.showSnackbar(context, AppString.nameError);
                  } else if (emailController.text.isEmpty) {
                    CommonUtils.showSnackbar(context, AppString.emailError);
                  } else if (!regex.hasMatch(emailController.text)) {
                    CommonUtils.showSnackbar(context, AppString.invalidEmail);
                  } else if (passwordController.text.isEmpty) {
                    CommonUtils.showSnackbar(context, AppString.passwordError);
                  } else if (!regexPassword.hasMatch(passwordController.text)) {
                    CommonUtils.showSnackbar(
                        context, AppString.passwordPattern);
                  } else {
                    String name = nameController.text;
                    String email = emailController.text;
                    String password = passwordController.text;
                    setState(() {
                      showInfoDialog(name, email, password);
                    });
                  }
                },
                child: const Text("Sign Up",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
            )),
      ),
    );
  }

  void showInfoDialog(String name, String email, String password) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Full Name",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text(name,
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10.0),
                  const Text("Email",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text(email,
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10.0),
                  const Text("Password",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  Text(password,
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Ok",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600))),
                  )
                ],
              ),
            ),
          );
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/screens/sign_up_screen.dart';
import 'package:task/utils/colors.dart';
import 'package:task/utils/images.dart';
import 'package:task/utils/strings.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200.0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(AppImage.backgroundImage),
                Image.asset(AppImage.logoImage),
              ],
            ),
          ),
          const SizedBox(height: 150.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text(AppString.welcome,
                    style: TextStyle(fontSize: 24.0, color: Colors.black)),
                const SizedBox(height: 20.0),
                const Text(
                   AppString.welcomeMsg,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, color: AppColor.textColor)),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size(150.0, 50.0)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColor.buttonColor)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                  },
                  child: const Text(AppString.skip,
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const SizedBox(
          height: 50.0,
          child: Text(AppString.appVersion,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0, color: Colors.black))),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_sign_up_animation/SignInPage.dart';
import 'package:sign_in_sign_up_animation/SignUpPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotate;
  bool isSignUpPageShow = false;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animationRotate = Tween<double>(begin: 0, end: 90).animate(controller);
    super.initState();
  }

// Controlling Actions
  onchanged() {
    isSignUpPageShow = !isSignUpPageShow;
    isSignUpPageShow ? controller.forward() : controller.reverse();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedBuilder(
          animation: animationRotate,
          builder: (context, child) {
            return Stack(
              children: [
                // Sign In Page Implementation
                AnimatedPositioned(
                  height: height,
                  width: width * 0.88,
                  left: isSignUpPageShow ? -width * 0.75 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: const SignInPage(),
                ),
                // Sign Up Page Implementation
                AnimatedPositioned(
                  height: height,
                  width: width * 0.95,
                  left: isSignUpPageShow ? width * 0.12 : width * 0.88,
                  duration: const Duration(milliseconds: 500),
                  child: const SignUpPage(),
                ),
                // Circular Avatar
                AnimatedPositioned(
                  left: 0,
                  top: height * 0.1,
                  right: isSignUpPageShow ? -width * 0.06 : width * 0.06,
                  duration: const Duration(milliseconds: 500),
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color.fromARGB(20, 255, 252, 252),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Color.fromARGB(255, 3, 51, 90),
                      ),
                    ),
                  ),
                ),
                // Sign In Text Animation Controlling
                AnimatedPositioned(
                  bottom: isSignUpPageShow ? height * 0.3 : height * 0.15,
                  left: isSignUpPageShow ? 0 : width * 0.2,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedDefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                      fontSize: isSignUpPageShow ? 25 : 35,
                      color: Colors.white60,
                    ),
                    duration: const Duration(milliseconds: 500),
                    child: Transform.rotate(
                      angle: (-animationRotate.value) * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          if (isSignUpPageShow) {
                            onchanged();
                          } else {
                            const SignInPage();
                          }
                        },
                        child: const SizedBox(
                          width: 160,
                          child: Text('SIGN IN'),
                        ),
                      ),
                    ),
                  ),
                ),
                // Sign Up Text Animation Controlling
                AnimatedPositioned(
                  bottom: isSignUpPageShow ? height * 0.15 : height * 0.3,
                  right: isSignUpPageShow ? width * 0.2 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedDefaultTextStyle(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kanit(
                      fontSize: isSignUpPageShow ? 35 : 25,
                      color: Colors.white60,
                    ),
                    duration: const Duration(milliseconds: 500),
                    child: Transform.rotate(
                      angle: (90 - animationRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          if (isSignUpPageShow) {
                            const SignUpPage();
                          } else {
                            onchanged();
                          }
                        },
                        child: const SizedBox(
                          width: 160,
                          child: Text('SIGN UP'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

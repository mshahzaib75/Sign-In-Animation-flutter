import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: const Color.fromARGB(255, 85, 84, 84),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
              height: height * 0.3,
              width: width * 0.6,
              child: Column(
                children: [
                  // Name TextField
                  SizedBox(
                    width: width * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          label: const Text(
                            'Email',
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  // Password TextField
                  SizedBox(
                    width: width * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: const Text(
                          'Password',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                      )),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}

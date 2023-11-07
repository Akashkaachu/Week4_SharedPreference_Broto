import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week4/home.dart';
import 'package:week4/sharedpreference.dart';

import 'package:week4/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final formKey = GlobalKey<FormState>();
String name = "";
String pass = "";

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Fingerprint-pana.png', // Replace with your image path
                        width: 500,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text(
                              "Welcome Back.",
                              style: GoogleFonts.poppins(
                                  fontSize: 40, fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              " Make it work,make it right,make it fast.",
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                name = value;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                  hintText: "Username ",
                                  border: OutlineInputBorder()),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter a name";
                                } else if (value.length < 3) {
                                  return "Enter Atleast 3 Digit";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                pass = value;
                              },
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.fingerprint),
                                suffixIcon: Icon(Icons.visibility_off),
                                hintText: "Password",
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (value.length < 6) {
                                  return "Enter 6 Digit Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScrn(),
                              ));
                            },
                            child: Text("Create Account?")),
                      ),
                      SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            onPressed: () async {
                              // ignore: non_constant_identifier_names
                              String SharedpreferenceUserName = "";
                              String SharedpreferencePassword = "";
                              if (formKey.currentState!.validate()) {
                                await SharedPreferenceClass.getusername()
                                    .then((value) {
                                  SharedpreferenceUserName = value!;
                                });
                                await SharedPreferenceClass.getpassword()
                                    .then((value) {
                                  SharedpreferencePassword = value!;
                                });
                                if (name == SharedpreferenceUserName &&
                                    pass == SharedpreferencePassword) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePg(),
                                  ));
                                } else {
                                  ShowSnackBar(context, Colors.red,
                                      "Username and password is Incorrect");
                                }
                              }
                            },
                            child: Text("LOGIN"),
                          ))
                    ],
                  )))),
    );
  }
}

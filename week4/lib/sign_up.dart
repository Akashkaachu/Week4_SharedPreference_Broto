import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week4/home.dart';
import 'package:week4/sharedpreference.dart';

class SignupScrn extends StatefulWidget {
  SignupScrn({super.key});

  @override
  State<SignupScrn> createState() => _SignupScrnState();
}

String userName = "";
String password = "";
String cpassword = "";
String phone = "";

class _SignupScrnState extends State<SignupScrn> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(18),
        width: size.width,
        child: Column(
          children: [
            Image.asset("assets/images/Mobile login-bro.png"),
            const Text("Create New Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29)),
            const Text(
              "Make It Work ,Make It Right ,Make it Fast",
              style: TextStyle(color: Colors.deepOrange),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      userName = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        label: const Text("Username"),
                        prefixIcon: const Icon(Icons.person_2_outlined)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Username";
                      } else if (value.length < 3) {
                        return "Atleast 3 words ";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text("Phone Number "),
                        prefixIcon: const Icon(Icons.phone)),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Phone Number";
                      } else if (value.length < 10 && value.length > 10) {
                        return "Enter 10 digit Number";
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text("Password "),
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: const Icon(Icons.visibility_off)),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a Password";
                      } else if (value.length < 6) {
                        return "Input Atleast 6 Digit number";
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      cpassword = value;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text("Confirm Password "),
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: const Icon(Icons.visibility_off)),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter password correctily ";
                      } else if (value.length < 6) {
                        return "Input Atleast 6 Digit number";
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      if (password == cpassword) {
                        await SharedPreferenceClass.saveusername(userName);
                        await SharedPreferenceClass.savepassword(password);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePg(),
                        ));
                      } else {
                        ShowSnackBar(context, Colors.red,
                            "password and confirm password is incorrect  ");
                      }
                    }
                  },
                  child: Text("SIGNUP"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                ))
          ],
        ),
      )),
    ));
  }
}

void ShowSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: const Duration(seconds: 5),
  ));
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login_page/register.dart';
import 'package:login_page/view/succes.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void signInWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.to(Get.dialog(const succes()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.dialog(AlertDialog(
          clipBehavior: Clip.none,
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.red),
                    height: 100,
                  ),
                  Positioned(
                    bottom: -40,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                        child: Lottie.asset(
                          'assets/images/warning.json',
                          repeat: true,
                          animate: true,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          titlePadding: const EdgeInsets.all(0),
          content: Container(
            width: 450,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "No user found for that email",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay'),
                  ),
                ),
              ],
            ),
          ],
        ));
      } else if (e.code == 'wrong-password') {
        Get.dialog(AlertDialog(
          clipBehavior: Clip.none,
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.red),
                    height: 100,
                  ),
                  Positioned(
                    bottom: -40,
                    right: 0,
                    left: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).dialogBackgroundColor,
                        ),
                        child: Lottie.asset(
                          'assets/images/warning.json',
                          repeat: true,
                          animate: true,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          titlePadding: const EdgeInsets.all(0),
          content: Container(
            width: 450,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Wrong password provided for that user.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          actions: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay'),
                  ),
                ),
              ],
            ),
          ],
        ));
      }
    }
  }

  double? nFormHeight = 30;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 135),
                child: const Text("Welcome \n back",
                    style: TextStyle(fontSize: 35, color: Colors.white)),
              ),
              SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left: 30,
                    right: 30),
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email can not be empty';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text("Email"),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: password,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password can not be empty';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text("Password"),
                                prefixIcon: Icon(
                                  Icons.fingerprint,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                    fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    signInWithEmailAndPassword();
                                  }
                                },
                                child: const Text('Sign up'),
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              //Get.to(const Register());

                              Navigator.pushNamed(context, 'register');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forget password',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 18),
                            ))
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

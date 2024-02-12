import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:login_page/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('/register.png'), fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, top: 80),
                child: const Text("Create \nAccount",
                    style: TextStyle(fontSize: 35, color: Colors.white)),
              ),
              SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28,
                    left: 30,
                    right: 30),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade400,
                          filled: true,
                          hintText: 'Name',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade400,
                          filled: true,
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade400,
                          filled: true,
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade400,
                          filled: true,
                          hintText: 'Mobile no.',
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontSize: 18),
                            )),
                        Container(
                          width: 110,
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(39, 135, 214, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  Get.to(const Login());
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          )),
    );
  }
}

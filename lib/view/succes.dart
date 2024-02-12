import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class succes extends StatefulWidget {
  const succes({super.key});

  @override
  State<succes> createState() => _succesState();
}

class _succesState extends State<succes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Lottie.asset(
              'assets/images/celebration.json',
              repeat: true,
              animate: true,
              width: 700,
              fit: BoxFit.cover,
            ),
          ),
          AlertDialog(
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
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.green),
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
                            'assets/tick-mark.json',
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
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text("Log in Successful")],
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
          ),
        ],
      )),
    );
  }
}

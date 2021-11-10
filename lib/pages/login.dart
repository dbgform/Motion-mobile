//import 'dart:js';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:jflutter_bike/hardcore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motion/misc/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool isLogin = false;

  bool _isProcessing = false;
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Get.toNamed('/');
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
            body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Container(
                //color: Colors.grey[200],
                alignment: Alignment.center,
                child: Container(

                    /// width: 1250,
                    // height: 600,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Center(child: leftHalf()), rightHalf()],
                      ),
                    )),
              ));
            }
            return CircularProgressIndicator();
          },
        )));
  }

  Widget rightHalf() {
    return Container(
      width: 625,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed('/');
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(17)),
                margin: EdgeInsets.symmetric(vertical: 30),
                height: 175,
                width: 320,
                child: Center(
                  child: Text(
                    'Free class',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        fontSize: 30.0),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget leftHalf() {
    return Container(
      width: 625,
      child: Container(
        color: Colors.white,
        width: 300,
        // margin: EdgeInsets.only(right: 50, top: 100),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = true;
                        });
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: isLogin ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                            fontSize: 30.0),
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLogin = false;
                        });
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: isLogin ? Colors.grey : Colors.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.0,
                            fontSize: 30.0),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                ),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _emailTextController,
                    focusNode: _focusEmail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // padding: EdgeInsets.only(left: 10, right: 30),
                //margin: EdgeInsets.only(left: 35, right: 32),
                SizedBox(
                  width: 400,
                  child: TextFormField(
                    controller: _passwordTextController,
                    focusNode: _focusPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Checkbox(
                //         value: false,
                //         onChanged: (bool? value) {
                //           return;
                //         }),
                //     SizedBox(
                //       width: 350,
                //       child: Wrap(
                //         children: [
                //           Text(
                //             'By creating an account, you agree to our ',
                //             style: TextStyle(fontSize: 18),
                //           ),
                //           Text(
                //             'Terms of Service, Membership Terms ',
                //             style: TextStyle(
                //                 color: Colors.lightBlue, fontSize: 18),
                //           ),
                //           Text('and ', style: TextStyle(fontSize: 18)),
                //           Text('Privacy Policy ',
                //               style: TextStyle(
                //                   color: Colors.lightBlue, fontSize: 18))
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  // margin: EdgeInsets.only(left: 44),
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(color: Colors.grey),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                            primary: Colors.grey,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            _focusEmail.unfocus();
                            _focusPassword.unfocus();

                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isProcessing = true;
                              });

                              User? user =
                                  await FireAuth.signInUsingEmailPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              );

                              setState(() {
                                _isProcessing = false;
                              });

                              if (user != null) {
                                Get.toNamed('/');
                              }
                            }
                          },
                          child: Center(
                            child: const Text('Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    fontSize: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

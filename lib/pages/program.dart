import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fan/hardcore.dart';

class ProgramPag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                width: 1920,
                color: Colors.grey[300],
                child: Column(
                  children: [
                    Container(
                      width: 1920,
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                              iconSize: 40.0,
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: 700,
                          ),
                          Text(
                            'MASTERING THE BASICS',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0,
                                fontSize: 30.0),
                          )
                        ],
                      ),
                    ),
                    //Text('SSSSSS'),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      width: 1300,
                      height: 550,
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 30),
                                color: Colors.blue,
                                height: 485,
                                width: 450,
                                child: Image.asset(
                                  'assets/12.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 50, top: 50),
                                    child: Text(
                                      'MASTERING THE BASICS',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.0,
                                          fontSize: 30.0),
                                    ),
                                  ),
                                  Container(
                                    width: 600,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey[200],
                                    ),
                                    margin: EdgeInsets.only(left: 50, top: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '7',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.0,
                                                  fontSize: 30.0),
                                            ),
                                            Text(
                                              'days',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w100,
                                                  letterSpacing: 1.0,
                                                  fontSize: 28.0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '2200.0',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.0,
                                                  fontSize: 30.0),
                                            ),
                                            Text(
                                              'kcal',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w100,
                                                  letterSpacing: 1.0,
                                                  fontSize: 28.0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Begineer',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 1.0,
                                                  fontSize: 30.0),
                                            ),
                                            Text(
                                              'Difficulty',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w100,
                                                  letterSpacing: 1.0,
                                                  fontSize: 28.0),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 50, top: 10),
                                    //  color: Colors.red,
                                    width: 500,
                                    height: 100,
                                    child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 1.0,
                                            fontSize: 18.0)),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 1300,
                      height: 355,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 5),
                                child: Text('Week',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.0,
                                        fontSize: 20.0)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                height: 2.0,
                                width: 60.0,
                                color: Colors.redAccent,
                              ),
                              Container(
                                height: 2.0,
                                width: 1300.0,
                                color: Colors.grey[300],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: Text('DAY 1',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.0,
                                        fontSize: 20.0)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              // buildImageCard(1)
                              Container(
                                  width: 300,
                                  height: 200,
                                  margin: EdgeInsets.only(left: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    //color: Colors.grey[200],
                                  ),
                                  child: Image.asset(cyclingList[0].image))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ))));
  }
}

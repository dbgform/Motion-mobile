import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fan/widgets/programsGridWidget.dart';

class ProgramsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 100,
            width: 380,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   boxShadow: [
            //     BoxShadow(
            //         color: Colors.grey.withOpacity(0.5),
            //         spreadRadius: 1,
            //         blurRadius: 1,
            //         offset: Offset(0, 1))
            //   ],
            // ),
            child: Image.asset('assets/logo1.png'),
          ),
          Container(
            height: 20,
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                height: 330,
                width: 300,
                child: Card(
                    elevation: 3,
                    //margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.yellow,
                    child: Container(
                      child: Column(
                        children: [
                          InkWell(
                            child: Container(
                              color: Colors.red,
                              height: 250,
                              // width: 320,
                              child: Image.asset(
                                'assets/11.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            onTap: () {
                              Get.toNamed('/program');
                            },
                          ),
                          Container(
                            color: Colors.white,
                            height: 62,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'MASTERING THE BASICS',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.0,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      '1 Week / 7 Days / 7 Classes',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w200,
                                          letterSpacing: 1.0,
                                          fontSize: 14.0),
                                    )
                                  ],
                                ),
                                // Icon(Icons.)
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}

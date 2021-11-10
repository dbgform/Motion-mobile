import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeVertical extends StatefulWidget {
  @override
  State<MeVertical> createState() => _MeVerticalState();
}

class _MeVerticalState extends State<MeVertical> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        children: [
          Container(
            height: 100,
            width: 250,
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
            child: Column(
              children: [
                CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                ),
                Text(
                  'П',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontSize: 25.0),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            color: Colors.white,
            width: 300,
            height: 300,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Подписка на 1 месяц',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontSize: 25.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '1200P',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontSize: 45.0),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: 200,
                  color: Colors.redAccent,
                  child: Center(
                    child: Text(
                      'Оплатить',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          fontSize: 30.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

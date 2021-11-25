import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion/hardcore.dart';
import 'package:intl/intl.dart';

class MeVertical extends StatefulWidget {
  @override
  State<MeVertical> createState() => _MeVerticalState();
}

class _MeVerticalState extends State<MeVertical> {
  final _weekFormatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
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
          buildSetting('Name', currentUser!.name),
          // buildSetting('Age', currentUser!.age.toString()),

          currentUser!.membership != null &&
                  !currentUser!.membership!.toDate().isBefore(DateTime.now())
              ? buildSetting('Membership',
                  _weekFormatter.format(currentUser!.membership!.toDate()))
              : buildSetting('', 'Нет активной подписки!'),
          //  buildSetting('Sex', currentUser!.age.toString()),
        ],
      ),
    );
  }

  Widget buildSetting(String setting, String data) {
    return Container(
      //height: 50,
      width: 380,
      decoration: BoxDecoration(color: Colors.grey[200], boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1))
      ]),
      child: Row(
          //alignment: Alignment.centerRight,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$setting',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  fontSize: 25.0),
            ),
            Text(
              '$data',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                  fontSize: 25.0),
            ),
          ]),
    );
  }

  DateTime convertTime(Timestamp? timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(
        timestamp!.millisecondsSinceEpoch * 1000);
  }
}

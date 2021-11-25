import 'package:flutter/material.dart';
import 'package:motion/hardcore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _currentDate = DateTime.now();
  final _dayFormatter = DateFormat('d');
  final _monthFormatter = DateFormat('MMM');
  final _weekFormatter = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Container(
            child: ListView(
      scrollDirection: Axis.vertical,
      children: buildRigthDays(),
    )));
  }

  List<Widget> buildRigthDays() {
    final dates = <Widget>[];

    for (int i = 0; i < 7; i++) {
      final date = _currentDate.add(Duration(days: i));
      // dates.add(Column(
      //   children: [
      //     Text(_dayFormatter.format(date)),
      //     Text(_monthFormatter.format(date)),
      //   ],
      // ));
      dates.add(Container(
        width: 380.0,
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
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
                      '${_dayFormatter.format(date) + ' ' + _monthFormatter.format(date)}',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          fontSize: 25.0),
                    ),
                    Text(
                      '${_weekFormatter.format(date)}',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                          fontSize: 25.0),
                    ),
                  ]),
            ),
            buildCard(i)
          ],
        ),
      ));
      dates.add(Container(
        width: 1.0,
        color: Colors.grey[400],
      ));
    }

    return dates;
  }

  List<Widget> buildDays() {
    //  int.parse(DateFormat('d').format(DateTime.now()).toString());
    int date = int.parse(DateFormat('d').format(DateTime.now()).toString());
    List<Widget> days = [];
    for (var i = date; i <= date + 6; i++) {
      days.add(Container(
        width: 380.0,
        color: Colors.grey[300],
        child: Column(
          children: [
            Container(
              //height: 50,
              width: 380,
              decoration: BoxDecoration(color: Colors.grey[200], boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1))
              ]),
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '$i nov',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontSize: 25.0),
                ),
              ),
            ),
            buildCard(i)
          ],
        ),
      ));
      days.add(Container(
        width: 1.0,
        color: Colors.grey[400],
      ));
    }
    return days;
  }

  Widget buildCard(int i) {
    //streamList[i].date.toDate().day;

    if (streamList[0].date.toDate().day == i) {
      print('GHOUGHJOFSHSKIGL');
    }
    Iterable<Stream> contain =
        streamList.where((element) => element.date.toDate().day == i);
    // ignore: unnecessary_statements

    if (contain.isNotEmpty) {
      print(contain);
      return Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          width: 350,
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1))
              ]),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '${contain.elementAt(0).date.toDate().hour}: ${contain.elementAt(0).date.toDate().minute}',
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      fontSize: 20.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 1,
                color: Colors.grey[300],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 250,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        '${contain.elementAt(0).description}\n${contain.elementAt(0).trainer}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                            fontSize: 20.0),
                      )),
                  CircleAvatar(
                    backgroundColor: Colors.brown.shade800,
                    radius: 35,
                    child: const Text('AH'),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: 250,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${contain.elementAt(0).difficulty}',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w200,
                            letterSpacing: 1.0,
                            fontSize: 20.0),
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 30, left: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border:
                            Border.all(color: Colors.redAccent, width: 1.6)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Get.toNamed('/justride', arguments: 1);
                      },
                      child: const Text(
                        'COUNT ME IN',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ));
    } else {
      return Container(
        width: 300,
        height: 10,
      );
    }
  }
}

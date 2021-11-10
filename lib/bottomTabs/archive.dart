import 'dart:async';
//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//import 'package:fan/bottomTabs/me.dart';
import 'package:fan/bottomTabs/programs.dart';
import 'package:fan/bottomTabs/meVertical.dart';
import 'package:fan/bottomTabs/schedule.dart';
import 'package:fan/misc/stateHelper.dart';
import 'package:fan/hardcore.dart';
import 'package:fan/widgets/archiveBarWidget.dart';
import 'package:package_info/package_info.dart';

import 'package:fan/widgets/verticalGridWidget.dart';

class ArchiveStateful extends StatefulWidget {
  const ArchiveStateful({Key? key}) : super(key: key);

  @override
  State<ArchiveStateful> createState() => _ArchiveStatefulState();
}

class _ArchiveStatefulState extends State<ArchiveStateful> {
  final List<int> dummy = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16];
  int _selectedIndex = 0;
  List<Widget> dumbList = [];
  static List<Widget> _widgetOptions = [
    TabBarView(children: [
      Container(
          //padding: EdgeInsets.only(left: 200.0, right: 200.0, top: 0),
          color: Colors.black12,
          child: Column(
            children: [
              //ConfigurationWidget(),
              Expanded(
                  //height: 2000,
                  child: StatefulWrapper(
                      child: SizedBox.expand(
                          child: Container(
                              child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: buildClassList()))),
                      onInit: () {
                        // buildClassList();
                        getClasses();
                      }))
            ],
          )),
      Container(
          //padding: EdgeInsets.only(left: 200.0, right: 200.0, top: 0),
          color: Colors.black12,
          child: Column(
            children: [
              //ConfigurationWidget(),
              Expanded(
                  child: StatefulWrapper(
                      child: VerticalGridWidget(type: 2),
                      onInit: () {
                        getClasses();
                      }))
            ],
          )),
      Container(
          //padding: EdgeInsets.only(left: 200.0, right: 200.0, top: 0),
          color: Colors.black12,
          child: Column(
            children: [
              // ConfigurationWidget(),
              Expanded(
                  child: StatefulWrapper(
                      child: VerticalGridWidget(type: 3),
                      onInit: () {
                        getClasses();
                      }))
            ],
          )),
    ]),
    Container(
        //padding: EdgeInsets.only(left: 200.0, right: 200.0, top: 0),
        color: Colors.black12,
        child: Column(
          children: [Expanded(child: SchedulePage())],
        )),
    ProgramsPage(),
    MeVertical()
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  late PackageInfo packageInfo;

  void checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    print(packageInfo);
  }

  // List<Hardcode> trainList = [u1,u2,u3,u4,u5,u6,u7,u8]; // void _listenSerial(BuildContext context) {
  //   Provider.of<StateManager>(context, listen: true).
  // }
  //List traintlist = [buildImageCard(0)];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: _selectedIndex == 0 || _selectedIndex == 1
                ? PreferredSize(
                    preferredSize: Size.fromHeight(120.0),
                    child: ArchiveAppBarWidget()
                    //MVPAppBarWidget()
                    )
                : PreferredSize(
                    child: AppBar(
                      backgroundColor: Colors.white,
                    ),
                    preferredSize: Size.fromHeight(0),
                  ),
            body:
                /*Container(
                    //padding: EdgeInsets.only(left: 200.0, right: 200.0, top: 0),
                    color: Colors.black12,
                    child: Column(
                      children: [
                        ConfigurationWidget(),
                        Expanded(child: GridWidget())
                      ],
                    )),*/
                _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: SizedBox(
              height: 80,
              child: BottomNavigationBar(
                selectedItemColor: Colors.red,
                type: BottomNavigationBarType.fixed,
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                unselectedItemColor: Colors.black45,
                items: [
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.article_sharp, size: 40),
                      label: 'Class Archive'),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.play_circle_fill, size: 40),
                      label: 'Schedule'),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.list, size: 40), label: 'Programs'),
                  BottomNavigationBarItem(
                      icon: new Icon(Icons.person, size: 40), label: 'Me')
                ],
              ),
            )));
  }
}

Widget buildImageCard(int index) => Card(
    elevation: 3,
    //margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    clipBehavior: Clip.antiAlias,
    // color: Colors.yellow,
    child: Stack(
      fit: StackFit.expand,
      children: [
        Ink.image(
          image: NetworkImage(cyclingList[index].image),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: () {
              Get.toNamed('/videoMobile', arguments: cyclingList[index].uri);
            },
          ),
        ),
        Positioned(
          //alignment: Alignment.topRight,
          top: 0.0,
          right: 5,
          child: IconButton(
            icon: Icon(
              Icons.favorite_outline,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        // Positioned(
        //     //alignment: Alignment.bottomRight,
        //     bottom: 20,
        //     right: 15,
        //     child: Row(
        //       children: [
        //         Icon(Icons.people, size: 25, color: Colors.white),
        //         Text(
        //           '50',
        //           style: TextStyle(color: Colors.white, fontSize: 18),
        //         )
        //       ],
        //     )),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 10),
              child: Text(
                '${cyclingList[index].details}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontSize: 22.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 10),
              child: Text(
                '${cyclingList[index].time} мин',
                style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.0,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 10),
              child: Text(
                '${cyclingList[index].studio}',
                style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.0,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, bottom: 20),
              child: Text(
                '${cyclingList[index].name}',
                style: TextStyle(
                    color: Colors.grey[100],
                    fontWeight: FontWeight.w200,
                    letterSpacing: 1.0,
                    fontSize: 18.0),
              ),
            ),
          ],
        )
      ],
    ));

List<Widget> buildClassList() {
  List<Widget> result = [];
  for (var i = 0; i < cyclingList.length; i++) {
    try {
      result.add(
        Container(width: 300, height: 230, child: buildImageCard(i)),
      );
    } catch (e) {}
  }
  return result;
}

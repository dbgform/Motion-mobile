import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:motion/misc/stateHelper.dart';
import 'package:motion/hardcore.dart';

class FreeClass extends StatefulWidget {
  @override
  State<FreeClass> createState() => _FreeClassState();
}

class _FreeClassState extends State<FreeClass> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Бесплатные тренировки",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Container(
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
                                      children: buildClassList(true)))),
                          onInit: () {
                            // buildClassList();
                            //   getClasses();
                          }))
                ],
              )),
        ));
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
              if (currentUser != null) {
                if (!currentUser!.membership!
                    .toDate()
                    .isBefore(DateTime.now())) {
                  Get.toNamed('/videoMobile',
                      arguments: cyclingList[index].uri);
                }
              }
              //Get.toNamed('/videoMobile', arguments: cyclingList[index].uri);
            },
          ),
        ),
        // Positioned(
        //   //alignment: Alignment.topRight,
        //   top: 0.0,
        //   right: 5,
        //   child: IconButton(
        //     icon: Icon(
        //       Icons.favorite_outline,
        //       size: 40,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {},
        //   ),
        // ),
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

List<Widget> buildClassList(bool isFree) {
  List<Widget> result = [];
  int length = 2;
  if (!isFree) {
    length = cyclingList.length;
  }
  for (var i = 0; i < length; i++) {
    try {
      result.add(
        Container(width: 300, height: 230, child: buildImageCard(i)),
      );
      //  print(result);
    } catch (e) {}
  }
  return result;
}

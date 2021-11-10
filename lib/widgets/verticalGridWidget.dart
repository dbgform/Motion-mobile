import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:fan/hardcore.dart';

class VerticalGridWidget extends StatefulWidget {
  final int type;
  const VerticalGridWidget({required this.type});
  @override
  _VerticalGridWidgetState createState() => _VerticalGridWidgetState();
}

class _VerticalGridWidgetState extends State<VerticalGridWidget> {
  List<Hardcode> trainList = [];
  @override
  void initState() {
    switch (widget.type) {
      case 1:
        trainList = cyclingList;
        break;
      case 2:
        trainList = cardioList;
        break;
      case 3:
        trainList = yogaList;
        break;
      default:
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: EdgeInsets.only(left: 210.0, right: 210.0, top: 40),
        //crossAxisCount: 6,
        itemBuilder: (context, index) => buildImageCard(index),
        // staggeredTileBuilder: (index) => StaggeredTile.extent(2, 280),
        // mainAxisSpacing: 25,
        //  crossAxisSpacing: 25,
        itemCount: trainList.length,
      );

  Widget buildImageCard(int index) => Container(
        height: 230,
        width: 300,
        child: Card(
            elevation: 3,
            //margin: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAlias,
            // color: Colors.yellow,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Ink.image(
                  image: NetworkImage(trainList[index].image),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/ride', arguments: trainList[index].uri);
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
                Positioned(
                    //alignment: Alignment.bottomRight,
                    bottom: 20,
                    right: 15,
                    child: Row(
                      children: [
                        Icon(Icons.people, size: 25, color: Colors.white),
                        Text(
                          '50',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, bottom: 10),
                      child: Text(
                        '${trainList[index].details}',
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
                        '${trainList[index].time} мин',
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
                        '${trainList[index].studio}',
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
                        '${trainList[index].name}',
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
            )),
      );
}

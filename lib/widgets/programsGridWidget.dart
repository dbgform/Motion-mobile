import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:motion/hardcore.dart';

class ProgramsGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(left: 210.0, right: 210.0, top: 40),
        crossAxisCount: 6,
        itemBuilder: (context, index) => buildImageCard(index),
        staggeredTileBuilder: (index) => StaggeredTile.extent(2, 320),
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
        itemCount: 1,
      );

  Widget buildImageCard(int index) => Card(
      elevation: 3,
      //margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
      ));
}

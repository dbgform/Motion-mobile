import 'package:flutter/material.dart';

class ArchiveAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              labelPadding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              //indicatorColor: Colors.red,
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
              labelColor: Colors.red,
              isScrollable: true,
              unselectedLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
              unselectedLabelColor: Colors.black87,
              indicator: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6.0)),
              indicatorPadding: EdgeInsets.all(10),
              tabs: [
                // Container(
                //   width: 50,
                //   height: 100,
                //   margin: EdgeInsets.symmetric(horizontal: 10),
                //   child: Column(
                //     children: [
                //       Icon(Icons.pedal_bike_outlined, size: 50),
                //       Text('CYCLING')
                //     ],
                //   ),

                // ),

                Tab(
                    icon: Icon(Icons.directions_bike, size: 45),
                    text: 'CYCLING',
                    iconMargin: EdgeInsets.all(0)
                    // icon: Icon(Icons.pedal_bike_outlined, size: 50),
                    // text: 'CYCLE',
                    // iconMargin: EdgeInsets.only(bottom: 0.0),
                    ),
                Tab(
                    icon: Icon(Icons.directions_run, size: 45),
                    text: 'CARDIO',
                    iconMargin: EdgeInsets.all(0)),
                Tab(
                    icon: Icon(Icons.emoji_people, size: 45),
                    text: 'YOGA',
                    iconMargin: EdgeInsets.all(0)),
              ],
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Text('aaaaa', style: TextStyle(color: Colors.black),),
            // )
          ],
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.pedal_bike_outlined))
      ],
    );
  }
}

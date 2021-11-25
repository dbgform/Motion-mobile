import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class VideoAppMobile extends StatefulWidget {
  @override
  _VideoAppStateMobile createState() => _VideoAppStateMobile();
}

class _VideoAppStateMobile extends State<VideoAppMobile> {
  late VideoPlayerController _controller;
  String data = Get.arguments;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(data)
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
          body: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.loose,
              children: [
            Container(
              color: Colors.black,
            ),

            _controller.value.isInitialized
                ? Center(
                    child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ))
                : Center(child: CircularProgressIndicator()),
            Positioned(
              child: IconButton(
                  // iconSize: 40.0,
                  onPressed: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.portraitUp,
                    ]);
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
              left: 25,
              top: 25,
            ),
            Positioned(
              left: 25,
              bottom: 25,
              child: RawMaterialButton(
                shape: CircleBorder(),
                fillColor: Colors.black26,
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  // size: 100,
                  color: Colors.white,
                ),
              ),
              // left: 100,
              // top: 800,
            ),
            // FractionallySizedBox(
            //   widthFactor: 0.7,
            //   alignment: Alignment.topCenter,
            //   child: VideoProgressIndicator(
            //     _controller,
            //     allowScrubbing: false,
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: false,
              ),
            )

            // GetBuilder<VideoStateManager>(
            //   // specify type as Controller
            //   init: VideoStateManager(), // intialize with the Controller
            //   builder: (value) => Container(
            //     margin: EdgeInsets.only(bottom: 1025),
            //     width: 1300,
            //     child: VideoProgressIndicator(
            //       value.controller,
            //       allowScrubbing: false,
            //     ),
            //   ),
            // ),
          ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //Wakelock.disable();
    _controller.dispose();
  }
}

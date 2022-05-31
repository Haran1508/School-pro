import 'package:flutter/material.dart';
import 'package:greenma_info_school/config/colors.dart';
import 'package:video_player/video_player.dart';

class VedioPlayScreen extends StatefulWidget {
  const VedioPlayScreen({Key key}) : super(key: key);

  @override
  _VedioPlayScreenState createState() => _VedioPlayScreenState();
}

class _VedioPlayScreenState extends State<VedioPlayScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch Class"),
        centerTitle: true,
        backgroundColor: new Color(0xffFF5C00),
      ),
      body: Column(children: [
        Container(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                    strokeWidth: 2,
                  )),
                ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('Super Strategy Session on Spherical Lenses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 04, horizontal: 10),
            child: Text('PHYSICS - 48 mins . By Shankar Roy',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16))),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

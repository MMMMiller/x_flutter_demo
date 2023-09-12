import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewerWidget extends StatefulWidget {
  final String url;

  const VideoViewerWidget(this.url, {super.key});

  @override
  State<StatefulWidget> createState() {
    return VideoViewerWidgetState();
  }
}

class VideoViewerWidgetState extends State<VideoViewerWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) async {
        await _controller.pause();
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonClickWidget(
        singleClick: () {
          if (_isEnd()) return;
          if (isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
          setState(() {
            isPlaying = !isPlaying;
          });
        },
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              VideoPlayer(_controller),
              if (!_controller.value.isInitialized)
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(),
                ),
              if (!isPlaying)
                const Icon(
                  Icons.slow_motion_video,
                  size: 36,
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isEnd() {
    return _controller.value.position.inMilliseconds ==
        (_controller.value.duration.inMilliseconds);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

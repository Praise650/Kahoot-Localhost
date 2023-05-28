import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? videoLink;
  final File? localVideoFile;

  const VideoPlayerWidget({
    Key? key,
    this.videoLink,
    this.localVideoFile,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _videoController = widget.videoLink != null
        ? VideoPlayerController.network(widget.videoLink!)
        : VideoPlayerController.file(widget.localVideoFile!);

    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            color: Colors.black,
            height: 200,
            width: 400,
            margin: const EdgeInsets.symmetric(vertical: 10),
            // constraints: BoxConstraints(
            //   maxWidth: MediaQuery.of(context).size.width * 0.65,
            //   minWidth: MediaQuery.of(context).size.width * 0.65,
            // ),
            child: Stack(
              children: [
                _videoController.value.isInitialized
                    ? Container(
                        height: 200,
                        width: 200,
                        child: AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(
                            _videoController,
                          ),
                        ),
                      )
                    : Container(),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _videoController.value.isPlaying
                            ? _videoController.pause()
                            : _videoController.play();
                      });
                    },
                    child: Icon(
                      _videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: _videoController.value.isPlaying
                          ? Colors.transparent
                          : Colors.white,
                      size: 44,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }
}

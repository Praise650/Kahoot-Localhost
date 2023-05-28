import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../styles/text.dart';

class AudioPlayerWidget extends StatefulWidget {
  final File? file;
  // final Function()? onPlay;
  // final Function()? onPause;

  const AudioPlayerWidget({
    Key? key,
    this.file,
    // this.onPlay,
    // this.onPause,
  }) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  // String audioasset = "assets/audio/red-indian-music.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {

      ByteData bytes = await rootBundle.load(widget.file!.path); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      //convert ByteData to Uint8List

      _audioPlayer.onDurationChanged.listen((Duration d) { //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {

        });
      });

      _audioPlayer.onPositionChanged.listen((Duration  p){
        currentpos = p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds:currentpos).inHours;
        int sminutes = Duration(milliseconds:currentpos).inMinutes;
        int sseconds = Duration(milliseconds:currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String? fileName = widget.file?.path.split('/').last;
    // Duration duration = Duration.zero;
    // Duration position = Duration.zero;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            fileName ?? "No title",
            style: kBodyText1TextStyle.copyWith(
              color: AppColor.textSecondary,
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
          ),
          Container(
            // height: 50,
            width: 300,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    _audioPlayer.play(UrlSource(widget.file!.path));
                  },
                  child: const Icon(Icons.play_arrow),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Slider(
                    value: double.parse(currentpos.toString()),
                    max: double.parse(maxduration.toString()),
                    min: 0,
                    divisions: maxduration,
                    label: currentpostlabel,
                    activeColor: AppColor.deepGreen,
                    onChanged: (value) {
                      setState(() {
                        _audioPlayer.seek(Duration(seconds: value.toInt()));
                      });
                    },
                  ),
                ),
                const SizedBox(width: 1),
                GestureDetector(
                  onTap: (){
                    _audioPlayer.stop();
                  },
                  child: const Icon(Icons.stop_circle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

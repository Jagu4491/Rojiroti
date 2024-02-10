import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  final String audioFile;
  final String imageAsset;
  final AudioPlayer audioPlayer;
  final bool isPlaying;
  final Duration duration;
  final VoidCallback playAudio;
  final VoidCallback stopAudio;

  const MusicPlayerScreen({
    required this.audioFile,
    required this.imageAsset,
    required this.audioPlayer,
    required this.isPlaying,
    required this.duration,
    required this.playAudio,
    required this.stopAudio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ram4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imageAsset),
              ),
              SizedBox(height: 16),
              Text(audioFile.split('/').last.replaceAll('.mp3', '')),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      icon: CircleAvatar(
                        child: Icon(Icons.stop),
                      ),
                      onPressed: stopAudio,
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: CircleAvatar(
                        child: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                      ),
                      onPressed: () {
                        isPlaying ? audioPlayer.pause() : playAudio();
                      },
                    ),
                  ),
                ],
              ),
              Slider(
                value: duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  audioPlayer.seek(Duration(seconds: value.toInt()));
                },
                min: 0.0,
                max: duration.inSeconds.toDouble(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
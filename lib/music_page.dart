import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final List<String> musicFiles = [
    'assets/bhajan/Avadhme.mp3',
    'assets/bhajan/HumKatha.mp3',
    "assets/bhajan/Ram Sita Ram.mp3",
    "assets/bhajan/RamAayenge.mp3",
    "assets/bhajan/YugRam.mp3",
  ];

  final List<String> imageAssets = [
    'assets/images/ram1.jpg',
    'assets/images/ram2.jpg',
    'assets/images/ram3.jpg',
    'assets/images/ram4.jpg',
    'assets/images/ram5.jpg',
  ];

  late List<AudioPlayer> _audioPlayers;
  late List<Duration> _durations;
  late Map<String, bool> isPlayingMap;
  int currentPlayingIndex = -1;

  @override
  void initState() {
    super.initState();

    _audioPlayers = List.generate(musicFiles.length, (index) => AudioPlayer());
    _durations = List.generate(musicFiles.length, (index) => Duration());
    isPlayingMap = Map.fromIterable(musicFiles, key: (file) => file, value: (file) => false);

    for (int i = 0; i < musicFiles.length; i++) {
      _audioPlayers[i].onPlayerStateChanged.listen((PlayerState state) {
        if (mounted) {
          setState(() {
            if (state == PlayerState.PLAYING) {
              isPlayingMap[musicFiles[i]] = true;
            } else {
              isPlayingMap[musicFiles[i]] = false;
            }
          });
        }
      });

      _audioPlayers[i].onDurationChanged.listen((Duration duration) {
        setState(() {
          _durations[i] = duration;
        });
      });
    }
  }

  void _playAudio(String audioFile, int index) {
    _audioPlayers[index].play(audioFile, isLocal: true);
    currentPlayingIndex = index;
  }

  void _stopAudio(int index) {
    _audioPlayers[index].stop();
  }

  @override
  void dispose() {
    for (var audioPlayer in _audioPlayers) {
      audioPlayer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ram2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.9),
          child: ListView.builder(
            itemCount: musicFiles.length,
            itemBuilder: (context, index) {
              final audioFile = musicFiles[index];
              final imageAsset = imageAssets[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(imageAsset),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(audioFile.split('/').last.replaceAll('.mp3', ''), style: TextStyle(fontWeight: FontWeight.bold)),
                    Slider(
                      value: _durations[index].inSeconds.toDouble(),
                      onChanged: (double value){
                      }, // Disable user dragging
                      min: 0,
                      max: (_durations[index].inSeconds > 0) ? _durations[index].inSeconds.toDouble() : 600.0,
                      activeColor: Colors.deepOrange,
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.all(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicPlayerScreen(
                        audioFile: audioFile,
                        imageAsset: imageAsset,
                        audioPlayer: _audioPlayers[index],
                        isPlaying: isPlayingMap[audioFile]!,
                        duration: _durations[index],
                        playAudio: () {
                          _playAudio(audioFile, index);
                          setState(() {
                            isPlayingMap[audioFile] = true;
                          });
                        },
                        stopAudio: () {
                          _stopAudio(index);
                          setState(() {
                            isPlayingMap[audioFile] = false;
                          });
                        },
                      ),
                    ),
                  );
                },
                trailing: Container(
                  width: 120.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: CircleAvatar(
                            child: Icon(Icons.stop,color: Colors.deepOrange,),
                          ),
                          onPressed: () => _stopAudio(index),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: CircleAvatar(
                            child: isPlayingMap[audioFile]!
                                ? Icon(Icons.pause,color: Colors.deepOrange,)
                                : Icon(Icons.play_arrow,color: Colors.deepOrange,),
                          ),
                          onPressed: () {
                            isPlayingMap[audioFile]!
                                ? _audioPlayers[index].pause()
                                : _playAudio(audioFile, index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

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
      appBar: AppBar(
        title: Text("Now Playing"),
      ),
      body: Column(
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
    );
  }
}
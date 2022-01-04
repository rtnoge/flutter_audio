import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    print('Playing');
                    await player.setAsset('assets/audio/welcome.mp3');
                    player.play();
                    print('After Playing');
                  } catch (e) {
                    print("Error catch: $e");
                  }
                },
                child: Text('Greetings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

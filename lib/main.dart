import 'package:flutter/material.dart';
import 'package:pusher_channels_flutter/pusher-js/core/pusher.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class ServerApp extends StatefulWidget {
  @override
  _ServerAppState createState() => _ServerAppState();
}

class _ServerAppState extends State<ServerApp> {
  late Pusher _pusher;

  @override
  Future<void> initState() async {
    super.initState();
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
        apiKey: "259797bf5d7537a90b43",
        cluster: "ap1",
      );
      await pusher.subscribe(channelName: 'presence-chatbox');
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _pusher.bind("movement-channel", (massageAdded) {
                  "UP";
                });
              },
              child: Text("UP"),
            ),
            ElevatedButton(
              onPressed: () {
                _pusher.bind("movement-channel", (massageAdded) {
                  "DOWN";
                });
              },
              child: Text("DOWN"),
            ),
            ElevatedButton(
              onPressed: () {
                _pusher.bind("movement-channel", (massageAdded) {
                  "LEFT";
                });
              },
              child: Text("LEFT"),
            ),
            ElevatedButton(
              onPressed: () {
                _pusher.bind("movement-channel", (massageAdded) {
                  "RIGHT";
                });
              },
              child: Text("RIGHT"),
            ),
          ],
        ),
      ),
    );
  }
}

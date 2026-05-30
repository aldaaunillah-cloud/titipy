import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  static final WebSocketService _instance = WebSocketService._internal();

  factory WebSocketService() => _instance;

  WebSocketService._internal();

  WebSocketChannel? channel;

  final StreamController<String> _controller =
      StreamController<String>.broadcast();

  bool _isConnected = false;

  void connect() {
    if (_isConnected) return;

    channel = WebSocketChannel.connect(Uri.parse('ws://192.168.0.106:3000'));

    _isConnected = true;

    channel!.stream.listen(
      (event) {
        _controller.add(event.toString());
      },
      onDone: () {
        _isConnected = false;
      },
      onError: (error) {
        _isConnected = false;
      },
    );
  }

  Stream<String> get stream => _controller.stream;

  void send(String message) {
    if (_isConnected) {
      channel?.sink.add(message);
    }
  }
}

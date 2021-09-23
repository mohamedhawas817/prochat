import 'package:flutter/material.dart';
import './screens/chat_screen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Chat',
      theme: ThemeData(

      ),
      home: ChatScreen(),

    );
  }
}

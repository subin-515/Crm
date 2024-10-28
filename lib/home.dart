import 'package:flutter/material.dart';

class homep extends StatefulWidget {
  const homep({super.key});

  @override
  State<homep> createState() => _homepState();
}

class _homepState extends State<homep> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hai'),
      ),
    );
  }
}
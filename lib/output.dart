import 'package:flutter/material.dart';

class Output extends StatefulWidget {
  final String url;
  const Output({super.key,required this.url});

  @override
  State<Output> createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Output'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            widget.url,
            style: TextStyle(fontSize: 24),
          ),
        ));
  }
}

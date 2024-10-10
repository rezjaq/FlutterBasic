import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String name;
  final String nim;

  const Footer({Key? key, required this.name, required this.nim})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          '$name | $nim',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

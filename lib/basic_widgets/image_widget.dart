import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 100, // agar output gambar tidak terlalu gede
      height: 100,
      child: Image(image: AssetImage("lib/image/logo_polinema.png")),
    );
  }
}

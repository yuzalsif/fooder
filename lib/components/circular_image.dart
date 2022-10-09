import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    Key? key,
    required this.imageProvider,
    required this.imageRadius,
  }) : super(key: key);

  final ImageProvider imageProvider;
  final double imageRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        backgroundImage: imageProvider,
        radius: imageRadius - 5,
      ),
    );
  }
}

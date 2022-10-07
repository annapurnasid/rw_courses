import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color placeholder;
  final String url;

  const ImageContainer(
      {Key? key,
      this.width,
      this.height,
      this.placeholder = const Color(0xFFEEEEEE),
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: placeholder,
          // can use the DecorationImage to control how the image fits inside the box
          image: url.contains('http')
              ? DecorationImage(image: NetworkImage(url))
              : null),
    );
  }
}

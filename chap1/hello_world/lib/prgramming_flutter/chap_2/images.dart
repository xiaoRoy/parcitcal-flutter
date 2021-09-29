import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  
  final String _imageUrl;

  static const TEST_URL = 'https://picsum.photos/250?image=9';

  ImageContainer(this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Image.network(_imageUrl)
    );
  }
}

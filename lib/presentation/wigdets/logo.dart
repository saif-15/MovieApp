import 'package:flutter/material.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

class Logo extends StatelessWidget {
  final double height;

  Logo({Key key, @required this.height})
      : assert(height != null, "height cant be null"),
        assert(height > 0, "height value must be greator than zero"),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pngs/logo.png",
      color: Colors.white,
      height: height.h,
    );
  }
}

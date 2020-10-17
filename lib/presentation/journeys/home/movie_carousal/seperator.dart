import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/themes/app_color.dart';

class Seperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      padding: EdgeInsets.only(top: Sizes.dimen_10, bottom: Sizes.dimen_32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1)),
          gradient:
              LinearGradient(colors: [AppColor.voilet, AppColor.royalBlue])),
    );
  }
}

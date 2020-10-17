import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/screenutils/screen_utils.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          right: Sizes.dimen_16.w,
          left: Sizes.dimen_16.w),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/svgs/menu.svg",
              height: Sizes.dimen_12.h,
            ),
            onPressed: () {},
          ),
          Expanded(child: Logo(height: Sizes.dimen_14.w)),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_14.h,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

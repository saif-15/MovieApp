import 'package:flutter/material.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/screenutils/screen_utils.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_card_widget.dart';
import 'package:movieapp/common/extensions/size_extension.dart';

class AnimatedCardWidget extends StatelessWidget {
  final int index;
  final String posterPath;
  final int movieId;
  final PageController pageController;

  AnimatedCardWidget(
      {this.index, this.posterPath, this.movieId, this.pageController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.9) *
                      ScreenUtil.screenHeight *
                      0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        index: index,
        posterPath: posterPath,
      ),
    );
  }
}

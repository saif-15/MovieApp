import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/screenutils/screen_utils.dart';
import 'package:movieapp/data/core/api_constants.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieBackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_20.w),
        child: Stack(children: [
          FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
              builder: (context, state) {
                if (state is MovieBackdropChanged) {
                  return CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          "${APIConstants.IMAGE_BASE_URL}${state.movie.backdropPath}");
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              height: 1,
              width: ScreenUtil.screenWidth,
              color: Colors.transparent,
            ),
          )
        ]),
      ),
    );
  }
}

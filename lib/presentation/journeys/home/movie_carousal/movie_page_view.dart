import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/constants/size_constants.dart';
import 'package:movieapp/common/screenutils/screen_utils.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/common/extensions/size_extension.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_card_widget.dart';

import 'animated_movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  MoviePageView({Key key, @required this.movies, @required this.defaultIndex})
      : assert(defaultIndex >= 0, "index cant be zero"),
        assert(movies != null, "movies cant be null"),
        super(key: key);
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.defaultIndex,
        keepPage: false,
        viewportFraction: 0.7);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight * 0.35,
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final movies = widget.movies[index];
          return AnimatedCardWidget(
            index: index,
            posterPath: movies.posterPath,
            movieId: movies.id,
            pageController: _pageController,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}

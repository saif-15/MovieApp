import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/movie_page_view.dart';
import 'package:movieapp/presentation/journeys/home/movie_carousal/seperator.dart';
import 'package:movieapp/presentation/wigdets/movie_app_bar.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';

class MovieCarousalWigdet extends StatelessWidget {
  final index;
  final List<MovieEntity> movies;

  MovieCarousalWigdet({Key key, @required this.movies, @required this.index})
      : assert(index >= 0, "index cant less than 0"),
        assert(movies != null, "movies cant be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(movies: movies, defaultIndex: index),
            MovieDataWidget(),
            Seperator()
          ],
        )
      ],
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/entities/noparams.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousal_event.dart';
part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarousalBloc(this.getTrending, this.movieBackdropBloc)
      : super(MovieCarousalInitial());

  @override
  Stream<MovieCarousalState> mapEventToState(
    MovieCarousalEvent event,
  ) async* {
    if (event is CarousalLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold((error) => MovieCarousalError(), (movies) {
        movieBackdropBloc
            .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
        return MovieCarousalLoaded(index: event.defaultIndex, movies: movies);
      });
    }
  }
}

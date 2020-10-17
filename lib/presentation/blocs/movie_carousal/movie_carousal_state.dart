part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalState extends Equatable {
  const MovieCarousalState();

  @override
  List<Object> get props => [];
}

class MovieCarousalInitial extends MovieCarousalState {}

class MovieCarousalError extends MovieCarousalState {}

class MovieCarousalLoaded extends MovieCarousalState {
  final List<MovieEntity> movies;
  final int index;

  MovieCarousalLoaded({this.movies, this.index = 0})
      : assert(index >= 0, "index cannot be less than zero");

  @override
  List<Object> get props => [index, movies];
}

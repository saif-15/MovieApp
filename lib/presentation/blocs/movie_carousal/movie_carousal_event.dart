part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalEvent extends Equatable {
  const MovieCarousalEvent();

  @override
  List<Object> get props => [];
}

class CarousalLoadEvent extends MovieCarousalEvent {
  final int defaultIndex;

  const CarousalLoadEvent({this.defaultIndex = 0})
      : assert(defaultIndex >= 0, "default index must greator than zero");

  @override
  List<Object> get props => [defaultIndex];
}

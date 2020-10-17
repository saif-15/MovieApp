import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/di/get_it.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';
import 'package:movieapp/presentation/movie_app.dart';
import 'package:movieapp/presentation/wigdets/movie_app_bar.dart';

import 'movie_carousal/movie_carousal_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarousalBloc _movieCarousalBloc;
  MovieBackdropBloc _backdropBloc;

  @override
  void initState() {
    _movieCarousalBloc = getItInstance<MovieCarousalBloc>();
    _movieCarousalBloc.add(CarousalLoadEvent());
    _backdropBloc = _movieCarousalBloc.movieBackdropBloc;
    super.initState();
  }

  @override
  void dispose() {
    _movieCarousalBloc?.close();
    _backdropBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _movieCarousalBloc),
          BlocProvider(create: (context) => _backdropBloc)
        ],
        child: Scaffold(
          body: BlocBuilder<MovieCarousalBloc, MovieCarousalState>(
            bloc: _movieCarousalBloc,
            builder: (context, state) {
              if (state is MovieCarousalLoaded) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarousalWigdet(
                          movies: state.movies, index: state.index),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: Placeholder(
                        color: Colors.green,
                      ),
                    )
                  ],
                );
              }
              return MovieAppBar();
            },
          ),
        ));
  }
}

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/core/api_client.dart';
import 'package:movieapp/data/data_source/movie_remote_datasource.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_comingsoon.dart';
import 'package:movieapp/domain/usecases/get_playingnow.dart';
import 'package:movieapp/domain/usecases/get_popular.dart';
import 'package:movieapp/domain/usecases/get_trending.dart';
import 'package:movieapp/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movieapp/presentation/blocs/movie_carousal/movie_carousal_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance
      .registerLazySingleton(() => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton(() => GetPlayingNow(getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());
  getItInstance.registerFactory(
      () => MovieCarousalBloc(getItInstance(), getItInstance()));
}

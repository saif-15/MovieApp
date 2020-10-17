import 'package:dartz/dartz.dart';
import 'package:movieapp/data/data_source/movie_remote_datasource.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/app_error.dart';
import 'package:movieapp/domain/entities/movie_entity.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSourceImpl remoteDataSourceImpl;

  MovieRepositoryImpl(this.remoteDataSourceImpl);
  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      var movies = await remoteDataSourceImpl.getTrending();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong!"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      var movies = await remoteDataSourceImpl.getComingSoon();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong!"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      var movies = await remoteDataSourceImpl.getPlayingNow();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong!"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      var movies = await remoteDataSourceImpl.getPopular();
      return Right(movies);
    } on Exception {
      return Left(AppError("Something went wrong!"));
    }
  }
}

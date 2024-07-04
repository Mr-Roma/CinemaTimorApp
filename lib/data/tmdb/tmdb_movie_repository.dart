import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flix_id/data/repositories/movie_repository.dart';
import 'package:flix_id/domain/entities/actor.dart';
import 'package:flix_id/domain/entities/movie.dart';
import 'package:flix_id/domain/entities/movie_detail.dart';
import 'package:flix_id/domain/entities/result.dart';

class TMDBMovieRepository implements MovieRepository {
  final Dio? _dio;
  final String _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjN2Y0YTlkZjg5NzMxNmZmZGVkYTJhMjI5MmRjZTkxMSIsIm5iZiI6MTcxOTM1MzIwMS41ODgzODYsInN1YiI6IjY2N2IyZmE4NjRkOGRjNDAxNGEwYjg4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wZ_N4ahTWWPSfVjwl8vnLSMdk1XUvpU-42gnR1l7Ys0";

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json',
  });

  TMDBMovieRepository({Dio? dio}) : _dio = dio ?? Dio();
  @override
  Future<Result<List<Actor>>> getActors({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id/credits?language=en-US',
          options: _options);

      final results = List<Map<String, dynamic>>.from(response.data['cast']);
      return Result.success(results.map((e) => Actor.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio!.get(
          'https://api.themoviedb.org/3/movie/$id?language=en-US',
          options: _options);

      return Result.success(MovieDetail.fromJSON(response.data));
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) {
    return _getMovies(_MovieCategory.nowPlaying.toString(), page: page);
  }

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) {
    return _getMovies(_MovieCategory.upcoming.toString(), page: page);
  }

  Future<Result<List<Movie>>> _getMovies(String category,
      {int page = 1}) async {
    try {
      final response = await _dio!.get(
        'https://api.themoviedb.org/3/movie/$category?language=en-US&page=$page',
        options: _options,
      );
      final results = List<Map<String, dynamic>>.from(response.data['results']);
      return Result.success(results.map((e) => Movie.fromJSON(e)).toList());
    } on DioException catch (e) {
      return Result.failed('${e.message}');
    }
  }

  @override
  getNowPlayingMovies(int page) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  getUpcomingMovies(int page) {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }
}

enum _MovieCategory { nowPlaying, upcoming }

String _movieCategoryToString(_MovieCategory category) {
  switch (category) {
    case _MovieCategory.nowPlaying:
      return 'now_playing';
    case _MovieCategory.upcoming:
      return 'upcoming';
    default:
      return '';
  }
}

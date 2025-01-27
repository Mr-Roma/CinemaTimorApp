import 'package:cinematl_app/data/repositories/movie_repository.dart';
import 'package:cinematl_app/domain/entities/movie_detail.dart';
import 'package:cinematl_app/domain/entities/result.dart';
import 'package:cinematl_app/domain/usecases/get_movie_detail/get_movie_detail_param.dart';
import 'package:cinematl_app/domain/usecases/usecase.dart';

class GetMovieDetail
    implements Usecase<Result<MovieDetail>, GetMovieDetailParam> {
  final MovieRepository _movieRepository;

  GetMovieDetail({required MovieRepository movieRepository})
      : _movieRepository = movieRepository;

  @override
  Future<Result<MovieDetail>> call(GetMovieDetailParam params) async {
    var movieDetailResult =
        await _movieRepository.getDetail(id: params.movie.id);

    return switch (movieDetailResult) {
      Success(value: final MovieDetail) => Result.success(MovieDetail),
      Failed(:final message) => Result.failed(message)
    };
  }
}

import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call() async{
    return repository.getPopularMovies();
  }
}
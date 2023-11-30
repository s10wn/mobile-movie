import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<List<Movie>> call(String query) async{
    return repository.searchMovies(query);
  }
}
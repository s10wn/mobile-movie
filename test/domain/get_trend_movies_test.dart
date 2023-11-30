
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repositories.dart';
import 'package:movie_app/domain/use_cases/get_trending_movies.dart';
import 'package:mockito/annotations.dart';

import 'get_trend_movies.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
  late GetTrendingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

  final movieList = [
    Movie(
      id: 1,
      title: 'Test',
      overview: 'Test',
      posterPath: 'Test',
    ),
    Movie(
      id: 2,
      title: 'Test',
      overview: 'Test',
      posterPath: 'Test',
    )];

  test('should take trend movies', () async {
    //arrange

    when(mockMovieRepository.getTrendingMovies())
      .thenAnswer((_) async => movieList);
    //act
    final result = await usecase();

    //assert
    expect(result, movieList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
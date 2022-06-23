import 'package:flutter/cupertino.dart';
import 'package:flutter3/movie_data.dart';

import '../movie_model.dart';

class MovieProvider extends ChangeNotifier{
  MovieRepository _movieRepository = MovieRepository();
  List<MovieModel> _movie = [];
  List<MovieModel> get movies => _movie;

  loadMovie() async {
    List<MovieModel>? movies = await _movieRepository.loadMovie();
    _movie = movies!;
    notifyListeners();
  }
}
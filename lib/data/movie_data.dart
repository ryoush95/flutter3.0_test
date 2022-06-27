import 'dart:convert';

import 'package:flutter3/config.dart';

import 'movie_model.dart';

import 'package:http/http.dart' as http;

class MovieRepository {
  Future<List<MovieModel>?> loadMovie() async {
    var queryParameters = {
      'api_key': '${config.api}'
    };
    var uri =
    Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);
    var response = await http.get(uri);
    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        return list.map<MovieModel>((item) => MovieModel.fromJson(item)).toList();
      }
    }
    return null;
  }
}
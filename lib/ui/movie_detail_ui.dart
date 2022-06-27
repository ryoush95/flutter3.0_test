import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter3/config.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool _loading = false;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    var queryParameters = {'api_key': '${config.api}'};
    var uri = Uri.https('api.themoviedb.org',
        '/3/movie/${widget.movieId.toString()}', queryParameters);
    print(uri);
    loadData(uri);
  }

  void loadData(Uri uri) async {
    var response = await http.get(uri);
    data = json.decode(response.body);
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.network(_loading
                          ? "https://image.tmdb.org/t/p/w500${data!['poster_path']}"
                          : ''),
                    ),
                    Text(widget.movieId.toString()),
                    Text(data!['title']),
                    Text(data!['vote_average'].toString()),
                    Text(data!['overview']),
                    Text(data!['homepage']),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

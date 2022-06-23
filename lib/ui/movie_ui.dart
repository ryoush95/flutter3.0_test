import 'package:flutter/material.dart';
import 'package:flutter3/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import '../movie_model.dart';

class Movie extends StatelessWidget {
  const Movie({Key? key}) : super(key: key);

  Widget _makeListView(List<MovieModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),                ),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500${list[index].posterPath}'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(list[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(child: Text(list[index].overview))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MovieProvider c = Provider.of<MovieProvider>(context, listen: false);
    c.loadMovie();
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text("Movie")),
      body: Container(
        child: Consumer<MovieProvider>(builder: (context, provider, widget) {
          if (provider.movies.length > 0) {
            return _makeListView(provider.movies);
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

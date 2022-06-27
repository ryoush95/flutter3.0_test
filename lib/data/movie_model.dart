class MovieModel {
  MovieModel({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  int id;
  String overview;
  String posterPath;
  String title;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "overview": overview,
    "poster_path": posterPath,
    "title": title,
  };
}
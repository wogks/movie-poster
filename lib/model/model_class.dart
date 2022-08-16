class PostersInfo {
  String title;
  String posterPath;
  num voteAverage;
  String overview;

  PostersInfo(
      {required this.title,
      required this.posterPath,
      required this.voteAverage,
      required this.overview});

  factory PostersInfo.fromjson(Map<String, dynamic> json) {
    return PostersInfo(
        title: json['title'] as String,
        posterPath: json['poster_path'] as String,
        voteAverage: json['vote_average'] as num,
        overview: json['overview'] as String);
  }
}

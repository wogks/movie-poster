import 'dart:convert';

import 'package:movieposter/model/model_class.dart';
import 'package:http/http.dart' as http;

class PosterApi {
  Future<PostersInfo> getPoster(String query) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=a64533e7ece6c72731da47c9c8bc691f&&language=ko-KR&query=$query');

    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    String title = json['title'] as String;
    String posterPath = json['poster_path'] as String;
    num voteAverage = json['vote_average'] as num;
    String overview = json['overview'] as String;

    return PostersInfo(
      title: title, 
      posterPath: posterPath, 
      voteAverage: voteAverage, 
      overview: overview);
  }
}

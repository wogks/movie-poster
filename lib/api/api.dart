import 'dart:convert';

import 'package:movieposter/model/model_class.dart';
import 'package:http/http.dart' as http;

class PosterApi {
  Future<List<PostersInfo>> getPoster(String query) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=a64533e7ece6c72731da47c9c8bc691f&&language=ko-KR&query=$query');

    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);

    Iterable results = json['results'];

    List<PostersInfo> posterResult =
        results.map((element) => PostersInfo.fromjson(element)).toList();

    return posterResult;

    // return results.map((e) => PostersInfo.fromjson(e));
  }
}

import 'package:flutter/material.dart';
import 'package:movieposter/model/model_class.dart';
import '../api/api.dart';

class PosterViewModel extends ChangeNotifier {
  final PosterApi _poster = PosterApi();

  List<PostersInfo> infos = [];

  // PostersInfo infos = PostersInfo(
  //   title: '',
  //   posterPath: '',
  //   voteAverage: 0,
  //   overview: 'overview',
  // );

  void fetchFosterInfo(String query) async {
    infos = await _poster.getPoster(query);

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/view_model_class.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String query = '';
    final viewModel = context.watch<PosterViewModel>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${viewModel.infos.where((element) => element.posterPath.contains(query))}',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

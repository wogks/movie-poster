import 'package:flutter/material.dart';
import 'package:movieposter/model/view_model_class.dart';
import 'package:movieposter/screens/detail_screen.dart';
import 'package:provider/provider.dart';

import '../debounce/debounce.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final viewModel = context.watch<PosterViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  _debouncer.run(
                      () => viewModel.fetchFosterInfo(_textController.text));
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: '검색어를 입력하세요',
                  hintStyle: const TextStyle(color: Colors.white),
                  suffixIcon: GestureDetector(
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onTap: () {
                      viewModel.fetchFosterInfo(_textController.text);
                    },
                  ),
                ),
                cursorColor: Colors.white,
                controller: _textController,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: viewModel.infos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  childAspectRatio: 2 / 3.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DetailScreen(),),
                      );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${viewModel.infos[index].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          viewModel.infos[index].title,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

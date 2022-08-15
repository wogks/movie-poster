import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: GestureDetector(
                child: const Icon(Icons.search,color: Colors.white,),
                onTap: () {},
              ),
            ),
            cursorColor: Colors.white,
            controller: _textController,
          ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieposter/model/view_model_class.dart';
import 'package:movieposter/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PosterViewModel(),
      child: const MyApp(),
      
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const MainScreen());
  }
}

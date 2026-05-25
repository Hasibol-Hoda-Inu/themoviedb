import 'package:flutter/material.dart';

import 'ui/screens/home.dart';

class TheMovieDB extends StatelessWidget {
  const TheMovieDB({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

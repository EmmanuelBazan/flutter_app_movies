import 'package:flutter/material.dart';
import 'package:flutter_application_movies/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      initialRoute: 'homeScreen',
      debugShowCheckedModeBanner: false,
      routes: {
        'homeScreen': (context) => const HomeScreen(),
        'detailScreen': (context) => DetailsScreen()
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}

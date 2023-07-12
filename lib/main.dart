import 'package:flutter/material.dart';
import 'package:flutter_application_movies/providers/movies_provider.dart';
import 'package:flutter_application_movies/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

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

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

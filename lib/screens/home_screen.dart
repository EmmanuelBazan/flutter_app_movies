import 'package:flutter/material.dart';
import 'package:flutter_application_movies/providers/movies_provider.dart';
import 'package:flutter_application_movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        CardSwiper(movies: moviesProvider.onDisplayMovies),
        const MovieSlider(),
      ])),
    );
  }
}

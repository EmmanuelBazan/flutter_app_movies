import 'package:flutter/material.dart';
import 'package:flutter_application_movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
          child: Column(children: const [
        CardSwiper(),
        MovieSlider(),
        MovieSlider(),
        MovieSlider(),
        MovieSlider(),
      ])),
    );
  }
}

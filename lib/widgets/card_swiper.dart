import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_movies/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: size.height * 0.5,
        width: double.infinity,
        child: const Center(
            child: CircularProgressIndicator(
          color: Colors.indigo,
        )),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      color: Colors.white,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detailScreen', arguments: movie);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/image_placeholder.png'),
                  image: NetworkImage(movie.fullPosterImg)),
            ),
          );
        },
      ),
    );
  }
}

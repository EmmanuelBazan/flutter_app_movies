import 'package:flutter/material.dart';
import 'package:flutter_application_movies/models/models.dart';
import 'package:flutter_application_movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMoviesCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 180,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final List<Cast> listCast = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
              itemCount: listCast.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                Cast cast = listCast[index];
                return _CastCard(
                  castImg: cast.fullProfilePath,
                  castName: cast.name,
                );
              }),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final String castImg;
  final String castName;

  const _CastCard({super.key, required this.castImg, required this.castName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/image_placeholder.png'),
            image: NetworkImage(castImg),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          castName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}

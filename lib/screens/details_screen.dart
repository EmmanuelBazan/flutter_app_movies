import 'package:flutter/material.dart';
import 'package:flutter_application_movies/models/models.dart';
import 'package:flutter_application_movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppbar(backdropPath: movie.fullBackdropPath, title: movie.title),
        SliverList(
            delegate: SliverChildListDelegate([
          _Poster(
              originalTitle: movie.originalTitle,
              posterImg: movie.fullPosterImg,
              title: movie.title,
              vote: movie.voteAverage),
          _OverView(overView: movie.overview),
          CastingCards(
            movieId: movie.id,
          )
        ]))
      ],
    ));
  }
}

class _CustomAppbar extends StatelessWidget {
  final String backdropPath;
  final String title;

  const _CustomAppbar(
      {super.key, required this.backdropPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 20),
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          width: double.infinity,
          child: Text(title),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading_placeholder.gif'),
          image: NetworkImage(backdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  final String posterImg;
  final String title;
  final String originalTitle;
  final double vote;

  const _Poster(
      {super.key,
      required this.originalTitle,
      required this.posterImg,
      required this.title,
      required this.vote});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/image_placeholder.png'),
            image: NetworkImage(posterImg),
            height: 150,
            // width: 100,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Text(
                originalTitle,
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${vote.toString()}/10',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _OverView extends StatelessWidget {
  final String overView;

  const _OverView({super.key, required this.overView});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        overView,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

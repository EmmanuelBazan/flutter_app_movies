import 'package:flutter/material.dart';
import 'package:flutter_application_movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppbar(),
        SliverList(
            delegate: SliverChildListDelegate([
          const _Poster(),
          const _OverView(),
          const _OverView(),
          const _OverView(),
          const CastingCards()
        ]))
      ],
    ));
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar({super.key});

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
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          width: double.infinity,
          child: const Text('movie.title'),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading_placeholder.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Poster extends StatelessWidget {
  const _Poster({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/image_placeholder.png'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
            // width: 100,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'movie.originalTitle',
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
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
                  'movie.voteAverage',
                  style: textTheme.caption,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'Cupidatat anim non ut in amet consequat excepteur aliqua ullamco irure dolor ex. Ex anim fugiat ea magna nostrud. Commodo duis velit non non duis consequat aliquip amet magna cillum fugiat amet non esse. Id culpa minim ut esse ipsum eiusmod cillum laborum sunt magna aute incididunt ut. Id officia culpa amet commodo irure velit eu Lorem excepteur officia et eiusmod.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}

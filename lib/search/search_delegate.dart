import 'package:flutter/material.dart';
import 'package:flutter_application_movies/models/models.dart';
import 'package:flutter_application_movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  Widget _emptyContainer() {
    return Container(
      color: Colors.transparent,
      child: const Center(
          child: Icon(
        Icons.movie_creation_outlined,
        size: 50,
        color: Colors.grey,
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();

        List<Movie> listMovie = snapshot.data!;

        return ListView.builder(
          itemCount: listMovie.length,
          itemBuilder: (context, index) =>
              _MovieItem(currentMovie: listMovie[index]),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie currentMovie;

  const _MovieItem({super.key, required this.currentMovie});

  @override
  Widget build(BuildContext context) {
    currentMovie.heroId = 'search-${currentMovie.id}';
    return ListTile(
      leading: Hero(
        tag: currentMovie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/image_placeholder.png'),
          image: NetworkImage(currentMovie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(currentMovie.title),
      subtitle: Text(currentMovie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'detailScreen', arguments: currentMovie);
      },
    );
  }
}

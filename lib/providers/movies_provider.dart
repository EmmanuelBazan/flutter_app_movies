import 'package:flutter/material.dart';
import 'package:flutter_application_movies/models/models.dart';
import 'package:flutter_application_movies/models/now_playing_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '7de4526afb410af4f76b69c33bcdc202';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('########## MOVIES PROVIDER INIT');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    print('### getOnDisplayMovies ${nowPlayingResponse.results[0].title}');

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}

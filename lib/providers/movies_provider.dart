import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('########## MOVIES PROVIDER INIT');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() {
    print('### getOnDisplayMovies');
  }
}

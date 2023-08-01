// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Film List`
  String get homePageTitle {
    return Intl.message(
      'My Film List',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get tabBarMovies {
    return Intl.message(
      'Movies',
      name: 'tabBarMovies',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get tabBarFavorites {
    return Intl.message(
      'Favorites',
      name: 'tabBarFavorites',
      desc: '',
      args: [],
    );
  }

  /// `An error occured, failure to process information!`
  String get responseError {
    return Intl.message(
      'An error occured, failure to process information!',
      name: 'responseError',
      desc: '',
      args: [],
    );
  }

  /// `Communication failure with the server, check your network connection!`
  String get timeoutError {
    return Intl.message(
      'Communication failure with the server, check your network connection!',
      name: 'timeoutError',
      desc: '',
      args: [],
    );
  }

  /// `An unknown failure has occurred!`
  String get unknowError {
    return Intl.message(
      'An unknown failure has occurred!',
      name: 'unknowError',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Grade`
  String get grade {
    return Intl.message(
      'Grade',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favoritesAppBar {
    return Intl.message(
      'Favorites',
      name: 'favoritesAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Nothing to see here, try adding some movies to your favorites list!`
  String get favoritesMessage {
    return Intl.message(
      'Nothing to see here, try adding some movies to your favorites list!',
      name: 'favoritesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Added to favorites list!`
  String get snackbarFavoriteSuccess {
    return Intl.message(
      'Added to favorites list!',
      name: 'snackbarFavoriteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Removed from favorites list!`
  String get snackbarUnFavoriteSuccess {
    return Intl.message(
      'Removed from favorites list!',
      name: 'snackbarUnFavoriteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `An error occured on loading favorite status!`
  String get snackbarFavoriteFetchError {
    return Intl.message(
      'An error occured on loading favorite status!',
      name: 'snackbarFavoriteFetchError',
      desc: '',
      args: [],
    );
  }

  /// `An error occured on favorite/unfavorite!`
  String get snackbarFavoriteChangeError {
    return Intl.message(
      'An error occured on favorite/unfavorite!',
      name: 'snackbarFavoriteChangeError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

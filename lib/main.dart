import 'package:domain/use_cases/add_on_favorites_uc.dart';
import 'package:domain/use_cases/get_favorite_list_uc.dart';
import 'package:domain/use_cases/get_is_favorite.dart';
import 'package:domain/use_cases/get_movie_detail_uc.dart';
import 'package:domain/use_cases/get_movie_list_uc.dart';
import 'package:domain/use_cases/remove_from_favorites_uc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:televi/data/cache/models/movie_detail_cm.dart';
import 'package:televi/di/providers.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/home_view.dart';
import 'package:televi/presentation/movies/detail/bloc/movie_detail_bloc.dart';
import 'package:televi/presentation/movies/detail/movie_detail_view.dart';
import 'package:televi/presentation/movies/list/favorites_list/bloc/favorites_bloc.dart';
import 'package:televi/presentation/movies/list/favorites_list/favorites_view.dart';
import 'package:televi/presentation/movies/list/movies_list/bloc/movies_bloc.dart';
import 'package:televi/presentation/movies/list/movies_list/movies_view.dart';
import 'package:televi/temas/theme.dart';

import 'data/cache/models/movie_cm.dart';

Future main() async {
  FluroRouter.appRouter
    ..define(
      '/',
      handler: Handler(
        handlerFunc: (context, params) => const HomeView(),
      ),
    )
    ..define(
      MoviesView.routeName,
      handler: Handler(
        handlerFunc: (context, params) =>
            ProxyProvider<GetMovieListUc, MoviesBloc>(
          update: (_, getMovieListUc, __) => MoviesBloc(getMovieListUc),
          dispose: (_, moviesBloc) => moviesBloc.dispose(),
          builder: (context, _) => MoviesView(
            moviesBloc: context.read<MoviesBloc>(),
          ),
        ),
      ),
    )
    ..define(
      '${MovieDetailView.routeName}/:id',
      transitionType: TransitionType.inFromRight,
      handler: Handler(
        handlerFunc: (context, params) {
          final movieId = int.parse(params['id']![0]);
          return ProxyProvider4<GetMovieDetailUc, GetIsFavoriteUc,
              AddOnFavoritesUc, RemoveFromFavoritesUc, DetailBloc>(
            update: (_, getMovieDetailUc, getIsFavoriteUc, addOnFavoriteUc,
                    removeFromFavoriteUc, __) =>
                DetailBloc(
              movieId,
              getIsFavoriteUc: getIsFavoriteUc,
              getMovieDetailUc: getMovieDetailUc,
              addOnFavoritesUc: addOnFavoriteUc,
              removeFromFavoritesUc: removeFromFavoriteUc,
            ),
            dispose: (context, detailBloc) => detailBloc.dispose(),
            builder: (context, _) => MovieDetailView(
              detailBloc: context.read<DetailBloc>(),
            ),
          );
        },
      ),
    )
    ..define(
      FavoritesView.routeName,
      handler: Handler(
        handlerFunc: (context, params) =>
            ProxyProvider<GetFavoriteListUc, FavoritesBloc>(
          update: (_, getFavoriteListUc, __) =>
              FavoritesBloc(getFavoriteListUc),
          dispose: (context, favoritesBloc) => favoritesBloc.dispose(),
          builder: (context, _) => FavoritesView(
            favoritesBloc: context.read<FavoritesBloc>(),
          ),
        ),
      ),
    );

  WidgetsFlutterBinding.ensureInitialized();

  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<MovieCm>(MovieCmAdapter())
    ..registerAdapter<MovieDetailCm>(MovieDetailCmAdapter());

  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'My Film List',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: const HomeView(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      navigatorObservers: <NavigatorObserver>[
        FirebaseAnalyticsObserver(
          analytics: context.read<FirebaseAnalytics>(),
        ),
      ],
      onGenerateRoute: (settings) => FluroRouter.appRouter
          .matchRoute(context, settings.name, routeSettings: settings)
          .route);

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

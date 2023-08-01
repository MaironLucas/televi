import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:televi/generated/l10n.dart';
import 'package:televi/presentation/helpers/flow.dart';
import 'package:televi/presentation/movies/list/favorites_list/favorites_view.dart';
import 'package:televi/presentation/movies/list/movies_list/movies_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentSelected = 0;
  List<BottomTabInfo> _screensFlow = [];
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      _screensFlow = [
        BottomTabInfo(
          title: Localizations.of<S>(context, S)!.tabBarMovies,
          iconData: const Icon(Icons.movie_outlined),
          key: GlobalKey<NavigatorState>(),
          initialRoute: MoviesView.routeName,
        ),
        BottomTabInfo(
          title: Localizations.of<S>(context, S)!.tabBarFavorites,
          iconData: const Icon(Icons.favorite_outlined),
          key: GlobalKey<NavigatorState>(),
          initialRoute: FavoritesView.routeName,
        ),
      ];
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: WillPopScope(
          onWillPop: () async => !await Navigator.maybePop(
            _screensFlow[_currentSelected].key.currentState!.context,
          ),
          child: IndexedStack(
            index: _currentSelected,
            children: _screensFlow
                .map(
                  (flow) => Navigator(
                    initialRoute: flow.initialRoute,
                    key: flow.key,
                    observers: <NavigatorObserver>[
                      FirebaseAnalyticsObserver(
                        analytics: context.read<FirebaseAnalytics>(),
                      ),
                    ],
                    onGenerateRoute: (settings) => FluroRouter.appRouter
                        .matchRoute(
                          context,
                          settings.name,
                          routeSettings: settings,
                        )
                        .route,
                  ),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _currentSelected,
          items: _screensFlow
              .map(
                (flow) => BottomNavigationBarItem(
                  icon: flow.iconData,
                  label: flow.title,
                ),
              )
              .toList(),
          onTap: (newIndex) => setState(
            () => _currentSelected = newIndex,
          ),
        ),
      );
}

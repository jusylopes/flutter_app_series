import 'package:flutter_app_series/utils/base_screen.dart';
import 'package:flutter_app_series/view/screens/fav_tv_show_screen.dart';
import 'package:flutter_app_series/view/screens/tv_show_screen.dart';
import 'package:flutter_app_series/view/screens/tv_show_search.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => BaseScreen(child: child),
        routes: [
          GoRoute(path: '/', builder: (context, state) => FavTvShowScreen()),
          GoRoute(
            path: '/tvshow/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return TvShowScreen(id: id);
            },
          ),
          GoRoute(
            path: '/search',
            builder: (context, state) => TvShowSearchScreen(),
          ),
        ],
      ),
    ],
  );
}

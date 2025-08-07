import 'package:flutter_app_series/utils/base_screen.dart';
import 'package:flutter_app_series/view/screens/tv_show_screen.dart';
import 'package:flutter_app_series/view/screens/tv_show_form_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/tv_show_view_model.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => BaseScreen(child: child),
        routes: [
          GoRoute(
            name: 'home',
            path: '/',
            builder: (_, __) => const TvShowScreen(),
          ),
          GoRoute(
            name: 'add',
            path: '/add',
            builder: (_, __) => const TvShowFormScreen(),
          ),
          GoRoute(
            name: 'edit',
            path: '/edit/:index',
            builder: (context, state) {
              final index = int.parse(state.pathParameters['index']!);
              return TvShowFormScreen(
                tvShow: context.read<TvShowViewModel>().tvShows[index],
              );
            },
          ),
        ],
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_app_series/utils/app_router.dart';
import 'package:flutter_app_series/providers/app_theme_view_model.dart';
import 'package:flutter_app_series/providers/tv_show_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TvShowViewModel()),
        ChangeNotifierProvider(create: (_) => AppThemeViewModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: context.read<AppThemeViewModel>().darkTheme,
      theme: context.read<AppThemeViewModel>().lightTheme,
      themeMode:
          context.watch<AppThemeViewModel>().isDark
              ? ThemeMode.dark
              : ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}

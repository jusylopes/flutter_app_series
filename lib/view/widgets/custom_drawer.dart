import 'package:flutter/material.dart';
import 'package:flutter_app_series/providers/app_theme_view_model.dart';
import 'package:flutter_app_series/utils/app_assets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.nameApp, height: 52),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: context.read<AppThemeViewModel>().switchTheme,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onSurface,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    icon:
                        !context.watch<AppThemeViewModel>().isDark
                            ? Icon(Icons.light_mode_rounded, size: 24)
                            : Icon(Icons.dark_mode_rounded, size: 24),
                    label: Text('Mudar Tema'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritas'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Buscar'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/search');
            },
          ),
        ],
      ),
    );
  }
}

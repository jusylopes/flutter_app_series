import 'package:flutter/material.dart';
import 'package:flutter_app_series/providers/app_theme_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  Text(
                    'Amo Séries 🎬',
                    style: GoogleFonts.lobster(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: context.read<AppThemeViewModel>().switchTheme,
                    icon:
                        context.watch<AppThemeViewModel>().isDark
                            ? Icon(Icons.wb_sunny_rounded, size: 24)
                            : Icon(Icons.nightlight_round_sharp, size: 24),
                    label: Text('Mudar Tema'),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Adicionar série'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/add');
            },
          ),
        ],
      ),
    );
  }
}

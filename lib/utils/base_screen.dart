import 'package:flutter/material.dart';
import 'package:flutter_app_series/view/widgets/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [const Text('Amo Séries 🎬')],
        ),
      ),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}

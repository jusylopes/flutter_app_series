import 'package:flutter/material.dart';
import 'package:flutter_app_series/utils/app_assets.dart';
import 'package:flutter_app_series/view/widgets/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.nameApp, height: 52)),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}

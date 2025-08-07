import 'package:flutter/material.dart';
import 'package:flutter_app_series/view/widgets/widgets_exports.dart';
import 'package:flutter_app_series/providers/tv_show_view_model.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<TvShowViewModel>(context);

    return ListView.builder(
      itemCount: model.tvShows.length,
      itemBuilder:
          (context, index) => Consumer<TvShowViewModel>(
            builder:
                (context, model, child) =>
                    TvShowCard(tvShow: model.tvShows[index], index: index),
          ),
    );
  }
}

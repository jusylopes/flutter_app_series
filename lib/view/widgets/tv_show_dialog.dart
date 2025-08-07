import 'package:flutter/material.dart';
import 'package:flutter_app_series/data/models/tv_show.dart';
import 'package:flutter_app_series/providers/tv_show_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TvShowDialog extends StatelessWidget {
  final TvShow tvShow;
  const TvShowDialog({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tvShow.title),
          IconButton.outlined(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close, size: 32),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text('Streaming: ${tvShow.stream}'),
          Text('Rating: ${tvShow.rating}'),
          Text(tvShow.summary),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            context.read<TvShowViewModel>().removeTvShow(tvShow, context);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          child: Text('REMOVER', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        ElevatedButton(
          onPressed: () {
            final index = context.read<TvShowViewModel>().tvShows.indexOf(
              tvShow,
            );
            Navigator.of(context).pop();
            context.go('/edit/$index');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          child: Text('EDITAR', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

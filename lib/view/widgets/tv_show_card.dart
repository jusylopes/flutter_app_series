import 'package:flutter/material.dart';
import 'package:flutter_app_series/data/models/tv_show.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app_series/view/widgets/widgets_exports.dart';

class TvShowCard extends StatelessWidget {
  final TvShow tvShow;
  final int index;
  const TvShowCard({super.key, required this.tvShow, required this.index});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.lobster(
              color: colorScheme.onPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          tvShow.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          tvShow.stream,
          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
        trailing: CustomRating(number: tvShow.rating),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => TvShowDialog(tvShow: tvShow),
          );
        },
      ),
    );
  }
}

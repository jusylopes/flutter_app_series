import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app_series/data/services/database_service.dart';
import 'package:flutter_app_series/data/models/tv_show.dart';
import 'package:sqflite/sqflite.dart';

class TvShowService {
  final DatabaseService databaseService;

  TvShowService({required this.databaseService});

  Future<List<TvShowModel>> getAll() async {
    final db = await databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('tv_shows');
    return _convertToList(maps);
  }

  List<TvShowModel> _convertToList(List<Map<String, dynamic>> maps) {
    return maps
        .map(
          (map) => TvShowModel(
            id: map['id'] as int,
            imageUrl: map['imageUrl'] as String? ?? '',
            name: map['name'] as String? ?? 'Desconhecido',
            webChannel: map['webChannel'] as String? ?? 'N/A',
            rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
            summary: map['summary'] as String? ?? 'Sem resumo disponível.',
          ),
        )
        .toList();
  }

  Future<void> insert(TvShowModel tvShow) async {
    final db = await databaseService.database;
    await db.insert(
      'tv_shows',
      tvShow.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> delete(int id) async {
    final db = await databaseService.database;
    await db.delete('tv_shows', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(TvShowModel tvShow) async {
    final tvShows = await getAll();
    return tvShows.any((show) => show.id == tvShow.id);
  }

  Future<TvShowModel> fetchTvShowById(int id) async {
    final response = await http.get(
      Uri.parse('https://api.tvmaze.com/shows/$id'),
    );

    if (response.statusCode == 200) {
      return TvShowModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao carregar série!');
    }
  }

  Future<List<TvShowModel>> fetchTvShows(String query) async {
    final response = await http.get(
      Uri.parse('https://api.tvmaze.com/search/shows?q=$query'),
    );

    if (response.statusCode == 200) {
      final List<TvShowModel> tvShows = [];
      json.decode(response.body).forEach((item) {
        tvShows.add(TvShowModel.fromJson(item['show']));
      });
      return tvShows;
    } else {
      throw Exception('Falha ao carregar séries!');
    }
  }
}

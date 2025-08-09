import 'package:flutter/material.dart';
import 'package:flutter_app_series/data/services/database_service.dart';
import 'package:flutter_app_series/data/models/tv_show.dart';
import 'package:flutter_app_series/data/services/tv_show_service.dart';

class TvShowViewModel extends ChangeNotifier {
  late final TvShowService _tvShowService;

  TvShowViewModel() {
    _tvShowService = TvShowService(databaseService: DatabaseService());
    initialize();
  }

  List<TvShowModel> _tvShows = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<TvShowModel> get tvShows => _tvShows;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasFavorites => _tvShows.isNotEmpty;

  Future<void> initialize() async {
    await load();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  Future<void> load() async {
    try {
      _setLoading(true);
      _setError(null);
      _tvShows = await _tvShowService.getAll();
    } catch (e) {
      _setError('Falha ao carregar séries favoritas: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addToFavorites(TvShowModel tvShow) async {
    await _tvShowService.insert(tvShow);
    _tvShows.add(tvShow);
    notifyListeners();
  }

  Future<void> removeFromFavorites(TvShowModel tvShow) async {
    await _tvShowService.delete(tvShow.id);
    _tvShows.removeWhere((show) => show.id == tvShow.id);
    notifyListeners();
  }

  Future<bool> isFavorite(TvShowModel tvShow) async {
    try {
      return await _tvShowService.isFavorite(tvShow);
    } catch (e) {
      _setError('Falha em verificar se é favorita: ${e.toString()}');
      return false;
    }
  }

  void sortByName(bool ascending) {
    _tvShows.sort(
      (a, b) => ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name),
    );
    notifyListeners();
  }

  void sortByRating(bool ascending) {
    _tvShows.sort(
      (a, b) =>
          ascending
              ? a.rating.compareTo(b.rating)
              : b.rating.compareTo(a.rating),
    );
    notifyListeners();
  }

  Future<TvShowModel> getTvShowById(int id) async {
    try {
      return await _tvShowService.fetchTvShowById(id);
    } catch (e) {
      throw Exception('Falha em carregar série: ${e.toString()}');
    }
  }

  Future<List<TvShowModel>> searchTvShows(String query) async {
    try {
      return await _tvShowService.fetchTvShows(query);
    } catch (e) {
      throw Exception('Falha em buscar séries: ${e.toString()}');
    }
  }

  void addTvShow(TvShowModel tvShow, BuildContext context) {
    tvShows.add(tvShow);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${tvShow.name} adicionada!',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void removeTvShow(TvShowModel tvShow, BuildContext context) {
    final index = tvShows.indexOf(tvShow);
    tvShows.remove(tvShow);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${tvShow.name} removida!'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'DESFAZER',
          onPressed: () {
            tvShows.insert(index, tvShow);
            notifyListeners();
          },
        ),
      ),
    );
    notifyListeners();
  }

  void editTvShow(
    TvShowModel oldTvShow,
    TvShowModel newTvShow,
    BuildContext context,
  ) {
    final index = tvShows.indexOf(oldTvShow);
    tvShows[index] = newTvShow;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Série ${index + 1} foi atualizada!'),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }
}

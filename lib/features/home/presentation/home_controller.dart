import 'package:flutter/foundation.dart';

import '../data/home_repository.dart';
import '../data/home_data.dart';

enum HomeStatus { loading, success, error }

/// Tải dữ liệu Home và hỗ trợ kéo xuống để làm mới.
class HomeController extends ChangeNotifier {
  HomeController([HomeRepository? repository]) : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;

  HomeStatus _status = HomeStatus.loading;
  HomeData? _data;
  Object? _error;

  HomeStatus get status => _status;
  HomeData? get data => _data;
  Object? get error => _error;

  /// Lần tải đầu: hiện loading toàn màn hình.
  Future<void> load() async {
    _status = HomeStatus.loading;
    notifyListeners();
    await _fetch();
  }

  /// Kéo xuống để làm mới: giữ dữ liệu cũ trên màn hình, không hiện loading.
  Future<void> refresh() => _fetch();

  Future<void> _fetch() async {
    try {
      _data = await _repository.fetchHome();
      _error = null;
      _status = HomeStatus.success;
    } catch (e) {
      _error = e;
      if (_data == null) _status = HomeStatus.error;
    }
    notifyListeners();
  }
}

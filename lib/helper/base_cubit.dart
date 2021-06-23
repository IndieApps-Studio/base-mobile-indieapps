import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/meta.dart';

abstract class BaseCubit<S, M> extends Cubit<S> {
  BaseCubit(S init) : super(init);

  int _currentPage = 1;
  int get currentPage => _currentPage;
  set setCurrentPage(int value) {
    _currentPage = value;
  }

  Meta _meta = Meta();
  Meta get meta => _meta;

  final List<M> _currentData = [];
  List<M> get currentData => _currentData;

  String _searchKey = '';
  String get searchKey => _searchKey;

  void addtoCurrent(Meta meta, List<M> data) {
    _meta = meta;
    _currentData.addAll(data);
  }

  Future<void> initial() async {
    _currentPage = 1;
    _currentData.clear();
  }

  Future<void> search(String searchKey, Map<String, String> filter,
      Map<String, String> sort) async {
    _searchKey = searchKey;
    _currentData.clear();
  }

  Future<bool> loadMore() async {
    final isCanLoadMore = (_meta.page < _meta.pages);

    if (isCanLoadMore) {
      _currentPage += 1;
    }

    return isCanLoadMore;
  }
}

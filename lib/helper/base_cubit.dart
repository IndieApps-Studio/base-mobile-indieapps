import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:base_mobile_indieapps/models/meta.dart';

abstract class BaseCubit<S, M> extends Cubit<S> {
  BaseCubit(S init) : super(init);

  int currentPage = 1;

  Meta _meta = Meta(0, 0, 0, 0);
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
    currentPage = 1;
    _currentData.clear();
  }

  Future<void> search(String searchKey, Map<String, String> filter,
      Map<String, String> sort) async {
    _searchKey = searchKey;
    _currentData.clear();
  }

  Future<bool> loadMore() async {
    final isCanLoadMore = _meta.page < _meta.pages;

    if (isCanLoadMore) {
      currentPage += 1;
    }

    return isCanLoadMore;
  }
}

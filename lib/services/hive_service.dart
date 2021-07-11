import 'package:base_mobile_indieapps/models/user.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/constant.dart';

class HiveService {
  final _keyPersonal = "personal-data";

  Future init() {
    return Hive.initFlutter();
  }

  Future openBoxPersonal() async {
    if (!Hive.isBoxOpen(_keyPersonal)) {
      Hive.registerAdapter(UserAdapter());
      return await Hive.openBox(_keyPersonal);
    }
  }

  User getUser() {
    final userId = _getUserId();
    return Hive.box(_keyPersonal).get(userId);
  }

  void storeUser(User user) {
    _storeUserId(user.id);
    Hive.box(_keyPersonal).put(user.id, user);
  }

  void _storeUserId(int userId) {
    Hive.box(_keyPersonal).put(kUserId, userId);
  }

  int _getUserId() {
    return Hive.box(_keyPersonal).get(kUserId);
  }

  void clearPersonal() {
    Hive.box(_keyPersonal).clear();
  }
}

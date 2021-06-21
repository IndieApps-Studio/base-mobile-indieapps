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
      return await Hive.openBox(_keyPersonal);
    }
  }

  void storeLearningToolCode(String code) {
    Hive.box(_keyPersonal).put(kLearningToolCode, code);
  }

  String getLearningToolCode() {
    return Hive.box(_keyPersonal).get(kLearningToolCode);
  }

  void storeUserId(String userId) {
    Hive.box(_keyPersonal).put(kUserId, userId);
  }

  String getUserId() {
    return Hive.box(_keyPersonal).get(kUserId);
  }

  void clearPersonal() {
    Hive.box(_keyPersonal).clear();
  }
}

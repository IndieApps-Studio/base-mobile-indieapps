import 'package:base_mobile_indieapps/models/user.dart';
import 'package:base_mobile_indieapps/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Container for store data in local storage.
/// TODO: cast the box to what type you want to store
class HiveService {
  /// Key to store user data ( class object ) in storage
  final _keyUser = 'user-data';
  /// Key to store only user id in storage
  final _keyUserId = 'user-id-data';
  /// Key to store user token in storage only for web
  final _keyTokenWeb = 'token-web';

  /// Initial HiveFlutter, used in MainRepository
  Future init() {
    return Hive.initFlutter();
  }

  /// Initial Open data from local storage.
  Future openBoxes() async {
    final isUserOpen = Hive.isBoxOpen(_keyUser);
    if (!isUserOpen) {
      await Hive.openBox<User>(_keyUser);
      Hive.registerAdapter(UserAdapter());
    }

    final isUserIdOpen = Hive.isBoxOpen(_keyUserId);
    if (!isUserIdOpen) {
      await Hive.openBox<int>(_keyUserId);
    }

    if (kIsWeb) {
      final isTokenWebOpen = Hive.isBoxOpen(_keyTokenWeb);
      if (!isTokenWebOpen) {
        await Hive.openBox<String>(_keyTokenWeb);
      }
    }
  }

  User? getUser() {
    final userId = getUserId();
    return Hive.box<User>(_keyUser).get(userId);
  }

  void storeUser(User user) {
    storeUserId(user.id);
    Hive.box<User>(_keyUser).put(user.id, user);
  }

  /// Store userId to local storage
  void storeUserId(int userId) {
    Hive.box<int>(_keyUserId).put(kUserId, userId);
  }

  /// Get userId from local storage
  String? getUserId() {
    return Hive.box<String>(_keyUserId).get(kUserId);
  }

  /// Store token to local storage only for web
  void storeToken(String token) {
    Hive.box<String>(_keyTokenWeb).put(kToken, token);
  }

  /// Get token from local storage only for web
  String? getToken() {
    return Hive.box<String>(_keyTokenWeb).get(kToken);
  }

  /// clear [_keyUser] in local storage.
  void clearPersonal() {
    Hive.box<void>(_keyUser).clear();
  }
}

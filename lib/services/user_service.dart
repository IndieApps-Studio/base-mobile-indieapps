
import 'package:base_mobile_indieapps/models/user.dart';
import 'package:base_mobile_indieapps/services/hive_service.dart';
import 'package:base_mobile_indieapps/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

/// Service to manage the user so that it can be used in any class.
class UserService {
  /// Get and set the user data
  late User user;

  /// Checking is user already has token or not
  /// use FlutterSecureStorage if on Android, iOS
  /// use Hive if on Web
  Future<String?> checkUserToken() async {
    late String? token;

    if (kIsWeb) {
      token = GetIt.I<HiveService>().getToken();
    } else {
      token = await GetIt.I<FlutterSecureStorage>().read(key: kToken);
    }

    return token;
  }
}

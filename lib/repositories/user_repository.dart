import 'package:base_mobile_indieapps/helper/base_repository.dart';
import 'package:base_mobile_indieapps/models/base_response.dart';
import 'package:base_mobile_indieapps/models/user.dart';
import 'package:base_mobile_indieapps/services/hive_service.dart';
import 'package:base_mobile_indieapps/services/user_service.dart';

import 'package:get_it/get_it.dart';

class UserRepository extends BaseRepository {
  Future<BaseResponse> fetchUser() async {
    final response = await fetch("https://api.github.com/users/zersya");

    if (response.statusCode == 200) {
      final data = User.fromJson(response.data);

      GetIt.I<HiveService>().storeUserId(data.id);
      GetIt.I<UserService>().setUser = data;
      return BaseResponse(
        statusCode: response.statusCode,
        data: data,
      );
    }

    return response;
  }
}

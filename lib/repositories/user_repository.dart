import 'package:base_mobile_indieapps/repositories/base_repository.dart';
import 'package:base_mobile_indieapps/models/base_response.dart';
import 'package:base_mobile_indieapps/models/user.dart';
import 'package:base_mobile_indieapps/services/hive_service.dart';

import 'package:get_it/get_it.dart';

class UserRepository extends BaseRepository {
  Future<BaseResponse<User>> getUserDetail() async {
    final response = await get("/users/Zersya");

    if (response.statusCode == 200) {
      final map = response.data!;

      final data = User.fromJson(map);

      GetIt.I<HiveService>().storeUser(data);
      return BaseResponse<User>.success(data);
    }

    return BaseResponse<User>.failure(response.message);
  }
}

import 'package:presensi/app/data/model/auth.dart';
import 'package:presensi/app/data/source/auth_api_service.dart';
import 'package:presensi/app/module/entity/auth.dart';
import 'package:presensi/app/module/repository/auth_repository.dart';
import 'package:presensi/core/constant/constant.dart';
import 'package:presensi/core/helper/shared_preferences_helper.dart';
import 'package:presensi/core/network/data_state.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<DataState> login(AuthEntity param) {
    return handleResponse(() => _authApiService.login(body: param.toJson()),
        (json) async {
      final authModel = AuthModel.fromJson(json);
      await SharedPreferencesHelper.setString(
          PREF_AUTH, '${authModel.tokenType} ${authModel.accessToken}');
      await SharedPreferencesHelper.setInt(PREF_ID, authModel.user.id);
      await SharedPreferencesHelper.setString(PREF_EMAIL, authModel.user.email);
      await SharedPreferencesHelper.setString(PREF_NAME, authModel.user.name);
      return null;
    });
  }
}

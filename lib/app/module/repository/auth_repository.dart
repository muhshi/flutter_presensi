import 'package:presensi/app/module/entity/auth.dart';
import 'package:presensi/core/network/data_state.dart';

abstract class AuthRepository {
  Future<DataState> login(AuthEntity param);
}

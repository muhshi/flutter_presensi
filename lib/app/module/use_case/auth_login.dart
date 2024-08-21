import 'dart:async';

import 'package:presensi/app/module/repository/auth_repository.dart';
import 'package:presensi/core/network/data_state.dart';
import 'package:presensi/core/use_case/app_use_case.dart';
import 'package:presensi/app/module/entity/auth.dart';

class AuthLoginUseCase extends AppUseCase<Future<DataState>, AuthEntity> {
  final AuthRepository _authRepository;

  AuthLoginUseCase(this._authRepository);

  Future<DataState> call({AuthEntity? param}) {
    return _authRepository.login(param!);
  }
}

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:presensi/app/data/repository/attendance_repository.dart';
import 'package:presensi/app/data/repository/auth_repository.dart';
import 'package:presensi/app/data/source/attendance_api_service.dart';
import 'package:presensi/app/data/source/auth_api_service.dart';
import 'package:presensi/app/module/repository/attendance_repository.dart';
import 'package:presensi/app/module/repository/auth_repository.dart';
import 'package:presensi/app/module/use_case/auth_login.dart';
import 'package:presensi/app/presentation/home/home_notifier.dart';
import 'package:presensi/app/presentation/login/login_notifier.dart';
import 'package:presensi/app/presentation/map/map_notifier.dart';
import 'package:presensi/core/network/app_interceptor.dart';
import 'package:presensi/core/use_case/attendance_get_this_month.dart';
import 'package:presensi/core/use_case/attendance_get_today.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  Dio dio = Dio();
  dio.interceptors.add(AppInterceptor());
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
  ));
  sl.registerSingleton<Dio>(dio);

  //apiservice
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AttendanceApiService>(AttendanceApiService(sl()));

//repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AttendanceRepository>(AttendanceRepositoryImpl(sl()));

  //usecase
  sl.registerSingleton<AuthLoginUseCase>(AuthLoginUseCase(sl()));
  sl.registerSingleton<AttendanceGetTodayUseCase>(
      AttendanceGetTodayUseCase(sl()));
  sl.registerSingleton<AttendanceGetMonthUseCase>(
      AttendanceGetMonthUseCase(sl()));

  //provider
  sl.registerFactoryParam<LoginNotifier, void, void>(
    (param1, param2) => LoginNotifier(sl()),
  );
  sl.registerFactoryParam<HomeNotifier, void, void>(
    (param1, param2) => HomeNotifier(sl(), sl()),
  );
  sl.registerFactoryParam<MapNotifier, void, void>(
    (param1, param2) => MapNotifier(),
  );
}

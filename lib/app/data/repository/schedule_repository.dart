import 'package:presensi/app/data/source/schedule_api_service.dart';
import 'package:presensi/app/module/entity/schedule.dart';
import 'package:presensi/app/module/repository/schedule_repository.dart';
import 'package:presensi/core/network/data_state.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleApiService _scheduleApiService;

  ScheduleRepositoryImpl(this._scheduleApiService);

  @override
  Future<DataState<ScheduleEntity>> get() {
    return handleResponse(() => _scheduleApiService.get(), (json) {
      return ScheduleEntity.fromJson(json);
    });
  }
}

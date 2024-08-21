import 'package:presensi/app/module/entity/schedule.dart';
import 'package:presensi/core/network/data_state.dart';

abstract class ScheduleRepository {
  Future<DataState<ScheduleEntity>> get();
}

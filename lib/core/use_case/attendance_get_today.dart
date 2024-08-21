import 'package:presensi/app/module/entity/attendance.dart';
import 'package:presensi/app/module/repository/attendance_repository.dart';
import 'package:presensi/core/network/data_state.dart';
import 'package:presensi/core/use_case/app_use_case.dart';

class AttendanceGetTodayUseCase
    extends AppUseCase<Future<DataState<AttendanceEntity?>>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetTodayUseCase(this._attendanceRepository);

  @override
  Future<DataState<AttendanceEntity?>> call({void param}) {
    // TODO: implement call
    return _attendanceRepository.getToday();
  }
}

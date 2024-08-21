import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
sealed class Attendance with _$Attendance {
  factory Attendance.entity(
      {@JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      String? date}) = AttendanceEntity;

  factory Attendance.paramEntity({
    required double latitude,
    required double longitude,
  }) = AttendanceParamEntity;

  factory Attendance.fromJson(Map<String, Object> json) =>
      _$AttendanceFromJson(json);
}

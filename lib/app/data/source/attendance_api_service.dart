import 'package:dio/dio.dart';
import 'package:presensi/core/constant/constant.dart';
import 'package:presensi/core/network/data_state.dart';
import 'package:retrofit/retrofit.dart';

part 'attendance_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio) {
    return _AttendanceApiService(dio);
  }

  @GET('/api/get-attendance-today')
  Future<HttpResponse<DataState>> getAttendanceToday();

  @POST('/api/send-attendance')
  Future<HttpResponse<DataState>> sendAttendance(
      {@Body() required Map<String, dynamic> body});
}

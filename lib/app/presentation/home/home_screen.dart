import 'package:flutter/material.dart';
import 'package:presensi/app/module/entity/attendance.dart';
import 'package:presensi/app/presentation/home/home_notifier.dart';
import 'package:presensi/app/presentation/map/map_screen.dart';
import 'package:presensi/core/helper/date_time_helper.dart';
import 'package:presensi/core/helper/global_helper.dart';
import 'package:presensi/core/widget/app_widget.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        _headerLayout(context),
        _todayLayout(context),
        Expanded(child: _thisMonthLayout(context))
      ],
    ));
  }

  _headerLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 40,
            ),
            backgroundColor:
                GlobalHelper.getColorScheme(context).primaryContainer,
            radius: 30,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Nama Pegawai",
                style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.HEADLINE_SMALL)
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Kantor"),
                    ],
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Siang")
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout))
        ],
      ),
    );
  }

  _todayLayout(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalHelper.getColorScheme(context).primary),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalHelper.getColorScheme(context).onPrimary),
                child: Row(
                  children: [
                    Icon(Icons.today),
                    SizedBox(
                      width: 5,
                    ),
                    Text(DateTimeHelper.formatDateTime(
                        dateTime: DateTime.now(), format: 'EEE, dd MM yyyy')),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: GlobalHelper.getColorScheme(context).onPrimary),
                  child: Text("WFA")),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              _timeTodayLayout(context, 'Datang',
                  notifier.attendanceToday?.startTime ?? '-'),
              _timeTodayLayout(
                  context, 'Pulang', notifier.attendanceToday?.endTime ?? '-'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            child: FilledButton(
                onPressed: () => _onPressCreateAttendance(context),
                child: Text('Buat Kehadiran'),
                style: FilledButton.styleFrom(
                    backgroundColor:
                        GlobalHelper.getColorScheme(context).onPrimary,
                    foregroundColor:
                        GlobalHelper.getColorScheme(context).primary)),
          ),
        ],
      ),
    );
  }

  _timeTodayLayout(BuildContext context, String label, String time) {
    return Expanded(
        child: Column(
      children: [
        Text(
          time,
          style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.HEADLINE_MEDIUM)
              ?.copyWith(
                  color: GlobalHelper.getColorScheme(context).onPrimary,
                  fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM)
              ?.copyWith(
            color: GlobalHelper.getColorScheme(context).onPrimary,
          ),
        )
      ],
    ));
  }

  _thisMonthLayout(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: GlobalHelper.getColorScheme(context).primaryContainer,
        ),
        child: Column(children: [
          Text('Presensi Sebulan Terakhir',
              style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.TITLE_LARGE)),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 1,
            color: GlobalHelper.getColorScheme(context).primary,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'tanggal',
                    style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.TITLE_SMALL),
                  )),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Datang',
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.TITLE_SMALL),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Pulang',
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.TITLE_SMALL),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 2,
            color: GlobalHelper.getColorScheme(context).primary,
          ),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = notifier.listAttendanceThisMonth[
                    notifier.listAttendanceThisMonth.length - index - 1];
                return _itemThisMonth(context, item);
              },
              separatorBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    height: 1,
                    color: GlobalHelper.getColorScheme(context).surface,
                  ),
              itemCount: notifier.listAttendanceThisMonth.length)
        ]));
  }

  _itemThisMonth(BuildContext context, AttendanceEntity item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: GlobalHelper.getColorScheme(context).primary),
                  child: Text(
                    DateTimeHelper.formatDateTimeFromString(
                        dateTimeString: item.date!, format: 'dd\nMMM'),
                    style: GlobalHelper.getTextStyle(context,
                            appTextStyle: AppTextStyle.BODY_MEDIUM)
                        ?.copyWith(
                            color:
                                GlobalHelper.getColorScheme(context).onPrimary),
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(item.startTime!,
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM)))),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(item.endTime!,
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.BODY_MEDIUM)))),
        ],
      ),
    );
  }

  _onPressCreateAttendance(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MapScreen(),
        ));
  }
}

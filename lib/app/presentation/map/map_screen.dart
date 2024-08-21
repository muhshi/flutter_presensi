import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:presensi/app/presentation/map/map_notifier.dart';
import 'package:presensi/core/helper/global_helper.dart';
import 'package:presensi/core/widget/app_widget.dart';
import 'package:presensi/core/widget/loading_app_widget.dart';

class MapScreen extends AppWidget<MapNotifier, void, void> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text("Buat kehadiran"),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: OSMFlutter(
            controller: notifier.mapController,
            osmOption: OSMOption(
                zoomOption: ZoomOption(initZoom: 15.5, minZoomLevel: 10.0)),
            onMapIsReady: (p0) {},
            mapIsLoading: LoadingAppWidget(),
          ),
        ),
        _footerLayout(context),
      ],
    ));
  }

  _footerLayout(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_city,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kantor',
                              style: GlobalHelper.getTextStyle(context,
                                  appTextStyle: AppTextStyle.TITLE_MEDIUM),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: GlobalHelper.getColorScheme(context)
                                    .primary,
                              ),
                              child: Text(
                                'WFA',
                                style: GlobalHelper.getTextStyle(context,
                                        appTextStyle: AppTextStyle.BODY_SMALL)
                                    ?.copyWith(
                                        color:
                                            GlobalHelper.getColorScheme(context)
                                                .onPrimary),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Siang',
                              style: GlobalHelper.getTextStyle(context,
                                  appTextStyle: AppTextStyle.TITLE_MEDIUM),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              child: Text('14:00:00 - 20:00:00',
                                  style: GlobalHelper.getTextStyle(context,
                                      appTextStyle: AppTextStyle.BODY_SMALL)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: SizedBox())
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: double.maxFinite,
                child: FilledButton(
                    onPressed: () {}, child: Text('Submit Kehadiran')))
          ],
        ));
  }
}

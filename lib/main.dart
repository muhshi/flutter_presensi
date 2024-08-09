import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:presensi/core/di/dependency.dart';
import 'package:presensi/core/widget/loading_app_widget.dart';

void main() async {
  await initializeDateFormatting('id', '');
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingAppWidget(),
    );
  }
}

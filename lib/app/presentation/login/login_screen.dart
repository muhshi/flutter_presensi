import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:presensi/app/presentation/login/login_notifier.dart';
import 'package:presensi/core/helper/global_helper.dart';
import 'package:presensi/core/widget/app_widget.dart';

class LoginScreen extends AppWidget<LoginNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Login Screen',
                    style: GlobalHelper.getTextStyle(context,
                            appTextStyle: AppTextStyle.HEADLINE_MEDIUM)
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Username',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: 'Password',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: double.maxFinite,
                  child: FilledButton(
                      onPressed: _onPressedLogin, child: Text('Login'))),
            ],
          )),
    );
  }

  _onPressedLogin() {}
}

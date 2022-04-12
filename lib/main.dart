import 'package:bloc/bloc.dart';
import 'package:change_first_login/shared/cubit/bloc_change.dart';
import 'package:flutter/material.dart';
import 'layout/bottomnavi.dart';
import 'modules/login.dart';
import 'modules/register.dart';

void main() {
  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:  BottomNavi(),
    );
  }
}


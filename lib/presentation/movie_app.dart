import 'package:flutter/material.dart';
import 'package:movieapp/common/screenutils/screen_utils.dart';
import 'package:movieapp/presentation/themes/app_color.dart';
import 'package:movieapp/presentation/themes/theme_text.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Movie App",
      theme: ThemeData(
          primaryColor: AppColor.vulcan,
          scaffoldBackgroundColor: AppColor.vulcan,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0)),
      home: HomeScreen(),
    );
  }
}

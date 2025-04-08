import 'package:conversor_de_moedas/App/HomePageView/home_page_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePageView(),
          theme: ThemeData(
            useMaterial3: true,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: 20.sp),
            ),
          ),
        );
      },
    );
  }
}

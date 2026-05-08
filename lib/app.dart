import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class TaskManegerApp extends StatelessWidget {
  const TaskManegerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: LightThemeData(),
    );
  }

  ThemeData LightThemeData() {
    //input decoration theme

    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
      // For text
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      //for button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          padding: EdgeInsets.symmetric(vertical: 12),
          foregroundColor: AppColors.white,
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

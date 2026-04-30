import 'package:flutter/material.dart';
import 'package:lockin/routing/app_router.dart';
import 'package:lockin/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UiAppTheme.lightTheme,
      darkTheme: UiAppTheme.darkTheme,
      routerConfig: goRouter,
    );
  }
}

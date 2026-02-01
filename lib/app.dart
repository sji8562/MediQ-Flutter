import 'package:flutter/material.dart';
import 'package:mediq_webapp/_core/constants/theme.dart';
import 'routes/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'MediQ',
      theme: AppTheme.light,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'counter/domain/counter_controller.dart';
import 'counter/presentation/counter_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;


  final CounterController _counterController = CounterController();

  bool get _useLightMode {
    switch (_themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  @override
  void dispose() {
    _counterController.dispose(); 
    super.dispose();
  }

  void _handleBrightnessChange(bool useLightMode) {
 
    setState(() {
      _themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Click Counter',
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      themeMode: _themeMode,
      home: CounterPage(
        controller: _counterController,
        title: 'Click Counter',
        useLightMode: _useLightMode,
        handleBrightnessChange: _handleBrightnessChange,
      ),
    );
  }
}

import 'package:flutter/foundation.dart';

class CounterController {
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  void increment() => count.value++;

  void reset() => count.value = 0;

  void dispose() => count.dispose();
}

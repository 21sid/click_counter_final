import 'package:flutter/material.dart';
import '../domain/counter_controller.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
    required this.controller,
    required this.title,
    required this.useLightMode,
    required this.handleBrightnessChange,
  });

  final CounterController controller;
  final String title;
  final bool useLightMode;
  final void Function(bool) handleBrightnessChange;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          _BrightnessButton(
            useLightMode: useLightMode,
            handleBrightnessChange: handleBrightnessChange,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),

            ValueListenableBuilder<int>(
              valueListenable: controller.count,
              builder: (context, value, _) {
                return Text(
                  '$value',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            TextButton.icon(
              onPressed: controller.reset,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


class _BrightnessButton extends StatelessWidget {
  const _BrightnessButton({
    required this.useLightMode,
    required this.handleBrightnessChange,
  });

  final bool useLightMode;
  final void Function(bool) handleBrightnessChange;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Toggle brightness',
      child: IconButton(
        icon: useLightMode
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () => handleBrightnessChange(!useLightMode),
      ),
    );
  }
}

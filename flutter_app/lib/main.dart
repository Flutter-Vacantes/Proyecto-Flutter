import 'package:flutter/material.dart';

void main() {
  runApp(flutterApp());
}

Widget flutterApp() {
  // Using ValueNotifier class allows to store a value and notify any listeners when the value changes.
  final ValueNotifier<double> counterNotifier = ValueNotifier<double>(0);
  counterNotifier.value = 1.0;

  return MaterialApp(
    title: 'Flutter App',
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 128, 19, 3), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Flutter App',
                style: TextStyle(
                  color: Color.fromARGB(255, 240, 65, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<double>(
              valueListenable: counterNotifier,
              builder: (context, counter, child) {
                return Text(
                  'Contador: $counter',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 240, 65, 1),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            /* Buttons. Row organize children elements horizontally.
               Remember to modify the functions. */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('+1')),
                ElevatedButton(onPressed: () {}, child: const Text('-1')),
                ElevatedButton(onPressed: () {counterNotifier.value *= 10;}, child: const Text('x10')),
                ElevatedButton(onPressed: () {}, child: const Text('%10')),
                ElevatedButton(onPressed: () {}, child: const Text('+5')),
                ElevatedButton(onPressed: () {}, child: const Text('Restart'))
              ],
            )
          ],
        ),
      ),
    ),
  );


}
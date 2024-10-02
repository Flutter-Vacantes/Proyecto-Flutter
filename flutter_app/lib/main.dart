import 'package:flutter/material.dart';

void main() {
  runApp(flutterApp());
}
Widget flutterApp() {
  // Crea un ValueNotifier para el contador
  final ValueNotifier<double> contadorNotifier = ValueNotifier<double>(0);
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
              valueListenable: contadorNotifier,
              builder: (context, contador, child) {
                return Text(
                  'Contador: $contador',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 240, 65, 1),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //Aligment center
              children: [
                ElevatedButton(onPressed: () {contadorNotifier.value +=1;}, child: const Text('+1')),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
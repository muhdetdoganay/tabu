import 'package:flutter/material.dart';
import 'package:tabu/myWidgets.dart';
import 'package:tabu/oyunEkrani.dart';
import 'package:tabu/skorboard.dart';

void main() {
  runApp(Skorboard());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isimAlma(
                  ad: 'Takım 1',
                  hint: 'TAKIM 1 İsmini girin',
                  focus: true,
                ),
                SizedBox(
                  height: 20,
                ),
                isimAlma(
                  ad: 'Takım 2',
                  hint: 'TAKIM 2 İsmini girin',
                  focus: false,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'BAŞLA',
                    style: TextStyle(color: Colors.white70),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigoAccent)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tabu/myWidgets.dart';
import 'package:tabu/oyunEkrani.dart';
import 'package:tabu/skorboard.dart';

import 'Takim.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  AnaSayfa({super.key});
  final Takim tkm1 = Takim();
  final Takim tkm2 = Takim();
  final List<Takim> tkmList = [];
  final String ad = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isimAlma(
                ad: ad,
                hint: 'TAKIM 1 İsmini girin',
                focus: true,
                tkm: tkm2,
              ),
              SizedBox(
                height: 20,
              ),
              isimAlma(
                ad: ad,
                hint: 'TAKIM 2 İsmini girin',
                focus: false,
                tkm: tkm2,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  tkmList.add(tkm1);
                  tkmList.add(tkm2);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OyunEkrani(
                        tkm: tkmList,
                        tur: 0,
                      ),
                    ),
                  );
                },
                child: Text(
                  'BAŞLA',
                  style: TextStyle(color: Colors.white70),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigoAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

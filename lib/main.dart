import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tabu/myWidgets.dart';
import 'package:tabu/oyunEkrani.dart';

import 'Takim.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
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
  final String ad2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isimAlma(
                ad: tkm1.getAd(),
                hint: 'TAKIM 1 İsmini girin',
                focus: true,
                tkm: tkm1,
              ),
              const SizedBox(
                height: 20,
              ),
              isimAlma(
                ad: tkm2.getAd(),
                hint: 'TAKIM 2 İsmini girin',
                focus: false,
                tkm: tkm2,
              ),
              const SizedBox(
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
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.indigoAccent),
                ),
                child: const Text(
                  'BAŞLA',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

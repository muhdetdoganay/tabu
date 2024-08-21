import 'package:flutter/material.dart';
import 'package:tabu/main.dart';

import 'Takim.dart';
import 'myWidgets.dart';
import 'oyunEkrani.dart';

class Skorboard extends StatelessWidget {
  Skorboard({super.key, required this.tur, required this.tkm});
  int tur;
  List<Takim> tkm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                skors(
                  metin: tkm[0].getAd(),
                  renk: Colors.deepPurple,
                  deger: tkm[0].getSkor(),
                ),
                skors(
                  metin: tkm[1].getAd(),
                  renk: Colors.deepOrange,
                  deger: tkm[1].getSkor(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>
                                    OyunEkrani(tur: tur + 1, tkm: tkm),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(Colors.teal),
                        ),
                        child: const Text(
                          'İLERLE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const MyApp(),
                              ),
                              (Route<dynamic> route) => false);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll<Color>(Colors.teal),
                        ),
                        child: const Text(
                          'BİTİR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tabu/main.dart';

import 'myWidgets.dart';
import 'oyunEkrani.dart';

class Skorboard extends StatelessWidget {
  const Skorboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                skors(
                  metin: 'Takım 1',
                  renk: Colors.deepPurple,
                  deger: 5,
                ),
                skors(
                  metin: 'Takım 2',
                  renk: Colors.deepOrange,
                  deger: 6,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.teal),
                    ),
                    child: Text(
                      'İLERLE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'Takim.dart';
import 'myWidgets.dart';

class OyunEkrani extends StatefulWidget {
  const OyunEkrani({super.key});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  int zaman = 10;
  int skor = 5;
  int pas = 4;
  Takim tkm = new Takim('sad', 5);

  @override
  Widget build(BuildContext context) {
    zamanAzaltma();
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OyunUstBilgi(
                          deger: zaman,
                          renk: Colors.blueGrey,
                          metin: 'Kalan Süre',
                        ),
                        OyunUstBilgi(
                          deger: tkm.getSkor(),
                          renk: Colors.lightGreenAccent,
                          metin: 'Skor',
                        ),
                        OyunUstBilgi(
                          deger: tkm.pas,
                          renk: Colors.pinkAccent,
                          metin: 'Pas Sayısı',
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 10,
                    child: Card(
                      margin: EdgeInsets.all(100),
                      color: Colors.blue,
                      child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'kelimelerin görüneceği alan',
                            textAlign: TextAlign.center,
                          )),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        altButton(
                          metin: 'Doğru',
                          renk: Colors.green,
                          secim: 1,
                          tkm: tkm,
                        ),
                        altButton(
                          metin: 'Pas',
                          renk: Colors.grey,
                          secim: 2,
                          pas: tkm.pas,
                          tkm: tkm,
                        ),
                        altButton(
                          metin: 'Yanlış',
                          renk: Colors.red,
                          secim: 0,
                          tkm: tkm,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void zamanAzaltma() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (zaman <= 0) {
          timer.cancel();
        } else {
          zaman--;
        }
      });
    });
  }
}

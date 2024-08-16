import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'myWidgets.dart';

class OyunEkrani extends StatefulWidget {
  const OyunEkrani({super.key});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  int sure = 10;
  int skor = 5;
  int pas = 3;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        OyunUstBilgi(
                          deger: sure,
                          renk: Colors.blueGrey,
                          metin: 'Kalan Süre',
                        ),
                        OyunUstBilgi(
                          deger: skor,
                          renk: Colors.lightGreenAccent,
                          metin: 'Kalan Süre',
                        ),
                        OyunUstBilgi(
                          deger: pas,
                          renk: Colors.pinkAccent,
                          metin: 'Kalan Süre',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Card(
                      margin: EdgeInsets.all(100),
                      color: Colors.blue,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
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
                        ),
                        altButton(
                          metin: 'Pas',
                          renk: Colors.grey,
                          secim: 2,
                        ),
                        altButton(
                          metin: 'Yanlış',
                          renk: Colors.red,
                          secim: 0,
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
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tabu/skorboard.dart';
import 'Takim.dart';
import 'myWidgets.dart';

class OyunEkrani extends StatefulWidget {
  final int tur;
  final List<Takim> tkm;

  const OyunEkrani({
    super.key,
    required this.tur,
    required this.tkm,
  });

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  int zaman = 10;
  late int sira;
  late String ad;

  @override
  void initState() {
    super.initState();
    sira = (widget.tur) % 2;
    widget.tkm[sira].pas = 3;
    ad = widget.tkm[sira].getAd();
    zamanAzaltma();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        deger: widget.tkm[sira].getSkor(),
                        renk: Colors.lightGreenAccent,
                        metin: 'Skor',
                      ),
                      OyunUstBilgi(
                        deger: widget.tkm[sira].pas,
                        renk: Colors.pinkAccent,
                        metin: 'Pas Sayısı',
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
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          '$ad',
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
                        tkm: widget.tkm[sira],
                      ),
                      altButton(
                        metin: 'Pas',
                        renk: Colors.grey,
                        secim: 2,
                        pas: widget.tkm[sira].pas,
                        tkm: widget.tkm[sira],
                      ),
                      altButton(
                        metin: 'Yanlış',
                        renk: Colors.red,
                        secim: 0,
                        tkm: widget.tkm[sira],
                      )
                    ],
                  ),
                ),
              ],
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Skorboard(
                tur: widget.tur,
                tkm: widget.tkm,
              ),
            ),
          );

          timer.cancel();
        } else {
          zaman--;
        }
      });
    });
  }
}

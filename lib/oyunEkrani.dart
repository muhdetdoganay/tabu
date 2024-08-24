import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tabu/Sayi.dart';
import 'package:tabu/skorboard.dart';
import 'AltButon.dart';
import 'Takim.dart';
import 'UstBilgi.dart';
import 'VeriCek.dart';
import 'IsimAlma.dart';

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
  final _firestore = FirebaseFirestore.instance;
  int zaman = 10;
  late int sira;
  late String ad;
  SayiRa sayi = SayiRa();

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
    CollectionReference kelime = _firestore.collection('tabu');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
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
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              ad,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          VeriCek(
                            main: kelime,
                            kelime: 'isim',
                            sayi: sayi.sayiGoster(),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          VeriCek(
                            main: kelime,
                            kelime: 'kelime1',
                            sayi: sayi.sayiGoster(),
                          ),
                          VeriCek(
                            main: kelime,
                            kelime: 'kelime2',
                            sayi: sayi.sayiGoster(),
                          ),
                          VeriCek(
                            main: kelime,
                            kelime: 'kelime3',
                            sayi: sayi.sayiGoster(),
                          ),
                          VeriCek(
                            main: kelime,
                            kelime: 'kelime4',
                            sayi: sayi.sayiGoster(),
                          ),
                          VeriCek(
                            main: kelime,
                            kelime: 'kelime5',
                            sayi: sayi.sayiGoster(),
                          ),
                        ],
                      ),
                    ),
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
                        sayi: sayi,
                      ),
                      altButton(
                        metin: 'Pas',
                        renk: Colors.grey,
                        secim: 2,
                        pas: widget.tkm[sira].pas,
                        sayi: sayi,
                        tkm: widget.tkm[sira],
                      ),
                      altButton(
                        metin: 'Yanlış',
                        renk: Colors.red,
                        secim: 0,
                        sayi: sayi,
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

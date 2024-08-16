import 'package:flutter/material.dart';

//-----------------------------------------GİRİŞ EKRANI WİDGET BAŞLANGIÇ----------------------------------------
class isimAlma extends StatelessWidget {
  late String ad, hint;
  late bool focus;
  isimAlma({required String ad, required String hint, required bool focus}) {
    this.ad = ad;
    this.focus = focus;
    this.hint = hint;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 40),
      color: Colors.white70,
      child: TextField(
        autofocus: focus,
        decoration: InputDecoration(hintText: hint),
        autofillHints: Characters(ad),
        onChanged: (String ad) {
          print(ad);
        },
      ),
    );
  }
}

//-----------------------------------------GİRİŞ EKRANI WİDGET BİTİŞ----------------------------------------
//-----------------------------------------OYUN EKRANI WİDGET BAŞLANGIÇ----------------------------------------
class OyunUstBilgi extends StatelessWidget {
  const OyunUstBilgi(
      {super.key,
      required this.deger,
      required this.renk,
      required this.metin});

  final int deger;
  final Color renk;
  final String metin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Card(
        color: renk,
        child: Text(
          '$metin: $deger',
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}

class altButton extends StatelessWidget {
  altButton({required this.metin, required this.renk, this.secim});
  final Color renk;
  final String metin;
  int? secim;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            if (this.secim == 1) {
              print('skor arttı');
            } else if (this.secim == 0) {
              print('skor azaldı');
            } else {
              print('hiçbir şey yapma');
            }
          },
          child: Text(metin),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(renk),
          )),
    );
  }
}

//-----------------------------------------OYUN EKRANI WİDGET BİTİŞ----------------------------------------

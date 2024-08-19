import 'package:flutter/material.dart';
import 'package:tabu/Takim.dart';

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
  const OyunUstBilgi({
    super.key,
    required this.deger,
    required this.renk,
    required this.metin,
  });

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

class altButton extends StatefulWidget {
  altButton(
      {required this.metin,
      required this.renk,
      this.secim,
      this.tkm,
      this.pas = 3});
  final Color renk;
  final String metin;
  int? secim;
  int pas;
  Takim? tkm;

  @override
  State<altButton> createState() => _altButtonState();
}

class _altButtonState extends State<altButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (widget.secim == 1) {
                widget.tkm?.skorArti();
              } else if (widget.secim == 0) {
                widget.tkm?.skorEksi();
              } else if (widget.secim == 2 && widget.tkm!.pas > 0) {
                widget.tkm?.pas--;
                print(widget.pas);
              }
            });
          },
          child: Text(widget.metin),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(widget.renk),
          )),
    );
  }
}

//-----------------------------------------OYUN EKRANI WİDGET BİTİŞ----------------------------------------

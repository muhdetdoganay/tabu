import 'package:flutter/material.dart';
import 'package:tabu/Takim.dart';

import 'Sayi.dart';

class altButton extends StatefulWidget {
  altButton(
      {super.key,
      required this.metin,
      required this.renk,
      required this.sayi,
      this.secim,
      this.tkm,
      this.pas = 3});
  final Color renk;
  final String metin;
  int? secim;
  int pas;
  Takim? tkm;
  final SayiRa sayi;

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
              } else if (widget.secim == 2 && widget.pas > 0) {
                widget.tkm?.pas--;
                print(widget.pas);
              }
              widget.sayi.sayiUret();
            });
          },
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(widget.renk),
          ),
          child: Text(widget.metin)),
    );
  }
}

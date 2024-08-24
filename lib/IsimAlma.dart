import 'package:flutter/material.dart';
import 'package:tabu/Takim.dart';

class isimAlma extends StatelessWidget {
  late String ad, hint;
  late bool focus;
  late Takim tkm;
  isimAlma(
      {super.key,
      required String ad,
      required String hint,
      required bool focus,
      required Takim tkm}) {
    this.ad = ad;
    this.focus = focus;
    this.hint = hint;
    this.tkm = tkm;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 40),
      color: Colors.white70,
      child: TextField(
        autofocus: focus,
        decoration: InputDecoration(hintText: hint),
        autofillHints: Characters(ad),
        onChanged: (String ad) {
          tkm.setAd(ad);
        },
      ),
    );
  }
}

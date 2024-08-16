import 'package:flutter/material.dart';

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

import 'package:flutter/material.dart';

class OyunUstBilgi extends StatelessWidget {
  const OyunUstBilgi({
    super.key,
    required this.deger,
    required this.renk,
    required this.metin,
    this.textStyle = 14,
    this.trenk = Colors.black,
  });

  final int deger;
  final Color renk;
  final Color trenk;
  final String metin;
  final double textStyle;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Card(
        color: renk,
        child: Text(
          textAlign: TextAlign.center,
          '$metin: $deger',
          style: TextStyle(fontSize: textStyle, color: trenk),
        ),
      ),
    ));
  }
}

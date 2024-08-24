import 'package:flutter/material.dart';

class skors extends StatelessWidget {
  const skors({
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
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: renk,
        ),
        alignment: Alignment.center,
        child: Text(
          '$metin $deger',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 70,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

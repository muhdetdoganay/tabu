import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriCek extends StatelessWidget {
  String kelime;
  int sayi;
  VeriCek({
    super.key,
    required this.main,
    required this.kelime,
    required this.sayi,
  });

  final CollectionReference<Object?> main;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: main.snapshots(),
        builder: (context, AsyncSnapshot asyncSnapshots) {
          List<DocumentSnapshot> lisOf = asyncSnapshots.data.docs;
          if (asyncSnapshots.hasData) {
            return Text(
              '${lisOf[sayi]['$kelime']}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            );
          } else {
            return Center(
                child: Text(
              "LOADING...",
              textAlign: TextAlign.center,
            ));
          }
        },
      ),
    );
  }
}

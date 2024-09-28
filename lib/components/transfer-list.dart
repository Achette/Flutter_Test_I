import 'package:flutter/material.dart';
import '../models/transfer.dart';
import 'transfer-item.dart';
import 'transfer-form.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  TransferList({super.key});

  @override
  State<StatefulWidget> createState() {
    return TransferListsState();
  }
}

class TransferListsState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferências",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(31, 104, 22, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
          itemCount: widget._transfers.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transfers[indice];
            return TransferItem(transferencia);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transfer?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransferForm();
            }),
          );
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transfers.add(transferenciaRecebida);
              });
            }
          });
        },
        backgroundColor: const Color.fromRGBO(31, 104, 22, 1),
        child: const Icon(
          Icons.add_circle_rounded,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}

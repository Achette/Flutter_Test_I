import 'package:flutter/material.dart';
import '../models/transfer.dart';
import 'transfer-item.dart';
import '../screens/transfer-form.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transfer> _transferencias = [];

  ListaTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferências",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
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
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add_circle_rounded,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}

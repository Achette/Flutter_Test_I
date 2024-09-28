import 'package:flutter/material.dart';
import '../models/transfer.dart';

class TransferItem extends StatelessWidget {
  final Transfer _transferencia;

  const TransferItem(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on, color: Colors.green),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

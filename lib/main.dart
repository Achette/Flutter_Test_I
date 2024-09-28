import 'package:flutter/material.dart';
import './components/transfer-list.dart';

void main() => runApp(const Banco());

class Banco extends StatelessWidget {
  const Banco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTransferencia(),
    );
  }
}

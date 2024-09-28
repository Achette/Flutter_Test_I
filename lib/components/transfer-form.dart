import 'package:flutter/material.dart';
import 'editor.dart';
import '../models/transfer.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  TransferForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nova Transferência",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(31, 104, 22, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Editor(
            controller: _controllerCampoNumeroConta,
            label: 'Número da conta',
            hint: '1234',
            icon: Icons.account_balance_rounded,
            iconColor: const Color.fromRGBO(31, 104, 22, 1),
            keyboardType: TextInputType.number,
          ),
          Editor(
            controller: _controllerCampoValor,
            label: 'Valor',
            hint: '0.00',
            icon: Icons.monetization_on_rounded,
            iconColor: const Color.fromRGBO(31, 104, 22, 1),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              _criarTransferencia(
                context,
                _controllerCampoNumeroConta,
                _controllerCampoValor,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(31, 104, 22, 1),
            ),
            child: const Text(
              'Confirmar',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  void _criarTransferencia(
    BuildContext context,
    TextEditingController controllerCampoNumeroConta,
    TextEditingController controllerCampoValor,
  ) {
    final int? numeroConta = int.tryParse(controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(controllerCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transfer(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

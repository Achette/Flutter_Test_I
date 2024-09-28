import 'package:flutter/material.dart';
import '../components/editor.dart';
import '../models/transfer.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _controllerCampoNumeroConta = TextEditingController();
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
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controllerCampoNumeroConta,
            rotulo: 'Número da conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controllerCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () {
              _criarTransferencia(
                context,
                _controllerCampoNumeroConta,
                _controllerCampoValor,
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
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

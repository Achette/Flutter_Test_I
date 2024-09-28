import 'package:flutter/material.dart';
import 'package:my_app/components/editor.dart';
import '../models/contact.dart';

class ContactForm extends StatelessWidget {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerCpf = TextEditingController();

  ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Novo Contato",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(40, 97, 159, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Editor(
              controller: _controllerName,
              label: 'Nome',
              hint: 'Alex Blue',
              icon: Icons.person_2_rounded,
              iconColor: const Color.fromRGBO(40, 97, 159, 1),
              keyboardType: TextInputType.text),
          Editor(
              controller: _controllerAddress,
              label: 'Endereço',
              hint: 'Rua Auspicueta, 201',
              icon: Icons.house_rounded,
              iconColor: const Color.fromRGBO(40, 97, 159, 1),
              keyboardType: TextInputType.streetAddress),
          Editor(
              controller: _controllerPhone,
              label: 'Telefone',
              hint: '(99) 9000-0000',
              icon: Icons.phone_android_rounded,
              iconColor: const Color.fromRGBO(40, 97, 159, 1),
              keyboardType: TextInputType.phone),
          Editor(
              controller: _controllerEmail,
              label: 'E-mail',
              hint: 'alex.blue@flutter.com',
              icon: Icons.email_rounded,
              iconColor: const Color.fromRGBO(40, 97, 159, 1),
              keyboardType: TextInputType.emailAddress),
          Editor(
              controller: _controllerCpf,
              label: 'CPF',
              hint: '000.000.000-00',
              icon: Icons.document_scanner_rounded,
              iconColor: const Color.fromRGBO(40, 97, 159, 1),
              keyboardType: TextInputType.number),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _createContact(context, _controllerName, _controllerAddress,
                  _controllerPhone, _controllerEmail, _controllerCpf);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(40, 97, 159, 1),
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
            ),
            child: const Text('Adicionar',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        ],
      ),
    );
  }

  void _createContact(
      BuildContext context,
      TextEditingController controllerName,
      TextEditingController controllerAddress,
      TextEditingController controllerPhone,
      TextEditingController controllerEmail,
      TextEditingController controllerCpf) {
    final String name = controllerName.text;
    final String address = controllerAddress.text;
    final String phone = controllerPhone.text;
    final String email = controllerEmail.text;
    final String cpf = controllerCpf.text;

    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        address.isEmpty ||
        cpf.isEmpty) return;

    final contact = Contact(name, address, phone, email, cpf);
    Navigator.pop(context, contact);
  }
}

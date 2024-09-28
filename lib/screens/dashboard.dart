import 'package:flutter/material.dart';
import 'package:my_app/components/contact_list.dart';
import 'package:my_app/components/item_dashboard.dart';
import 'package:my_app/components/transfer-list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white)),
        backgroundColor: const Color.fromRGBO(34, 12, 71, 1),
      ),
      backgroundColor: Colors.white,
      body: GridView.count(crossAxisCount: 2, children: [
        ItemDashboard(
            title: "Transferências",
            icon: Icons.monetization_on,
            colorBg: const Color.fromRGBO(31, 104, 22, 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransferList()));
            }),
        ItemDashboard(
            title: "Contatos",
            icon: Icons.contacts,
            colorBg: const Color.fromRGBO(40, 97, 159, 1),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactList()));
            })
      ]),
    );
  }
}

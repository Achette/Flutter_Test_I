import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard.dart';


void main() => runApp(const Banco());

class Banco extends StatelessWidget {
  const Banco({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}

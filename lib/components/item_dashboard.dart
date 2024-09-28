import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color colorBg;
  final VoidCallback onTap;

  const ItemDashboard(
      {super.key,
      required this.title,
      required this.icon,
      required this.colorBg,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          margin: const EdgeInsets.all(16),
          color: colorBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 52,
                color: Colors.white,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              )
            ],
          )),
    );
  }
}

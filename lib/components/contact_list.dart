import 'package:flutter/material.dart';
import 'package:my_app/models/contact.dart';
import './contact_item.dart';
import './contact_form.dart';

class ContactList extends StatefulWidget {
  final List<Contact> _contacts = [];

  ContactList({super.key});

  @override
  State<StatefulWidget> createState() {
    return ContactsListState();
  }
}

class ContactsListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color.fromRGBO(40, 97, 159, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: widget._contacts.length,
        itemBuilder: (context, i) {
          final contact = widget._contacts[i];
          return ContactItem(contact);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Contact?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          }));
          future.then((contactCreated) {
            if (contactCreated != null) {
              setState(() {
                widget._contacts.add(contactCreated);
              });
            }
          });
        },
        backgroundColor: const Color.fromRGBO(40, 97, 159, 1),
        child:
            const Icon(Icons.add_circle_rounded, size: 35, color: Colors.white),
      ),
    );
  }
}

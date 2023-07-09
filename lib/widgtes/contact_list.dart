import 'package:flutter/material.dart';
import 'package:khata_app/widgtes/contact_item.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return const ContactItem();
        },
      ),
    );
  }
}

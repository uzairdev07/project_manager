import 'package:flutter/material.dart';
import 'package:khata_app/models/contact.dart';
import 'package:khata_app/pages/customer_projects_page.dart';

class ContactItem extends StatelessWidget {
  MyContact contact;

  ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(contact.getName),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CustomerProjectPage(),
          ),
        );
      },
      leading: const Icon(Icons.person),
      trailing: Text(contact.getPayment.toString()),
    );
  }
}

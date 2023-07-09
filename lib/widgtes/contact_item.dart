import 'package:flutter/material.dart';
import 'package:khata_app/pages/customer_projects_page.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Customer Name'),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CustomerProjectPage(),
          ),
        );
      },
      leading: const Icon(Icons.person),
      trailing: const Text('Rs. 15,582'),
    );
  }
}

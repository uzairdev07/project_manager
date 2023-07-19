import 'package:flutter/material.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/pages/customer_projects_page.dart';

class CustomerItem extends StatelessWidget {
  Customer customer;

  CustomerItem({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(customer.getName),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomerProjectPage(
              customer: customer,
            ),
          ),
        );
      },
      leading: const Icon(Icons.person),
      trailing: Text(customer.getTotal.toString()),
    );
  }
}

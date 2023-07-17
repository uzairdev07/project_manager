import 'package:flutter/material.dart';
import 'package:khata_app/models/customer.dart';

class CustomerList extends StatefulWidget {
  static List<Customer> customers = [];

  CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CustomerList.customers.length,
      itemBuilder: (context, index) {
        final customer = CustomerList.customers[index];
        return ListTile(
          title: Text(customer.getName), // Corrected the method call here
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          trailing: Text(customer.getPayment.toString()),
        );
      },
    );
  }
}

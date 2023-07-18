import 'package:flutter/material.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/widgtes/contact_list.dart';

class AddCustomerProjectPage extends StatefulWidget {
  const AddCustomerProjectPage({Key? key}) : super(key: key);

  @override
  State<AddCustomerProjectPage> createState() => _AddCustomerProjectPageState();
}

class _AddCustomerProjectPageState extends State<AddCustomerProjectPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add customer'),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: false,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: const InputDecoration(
              hintText: 'Search Customer',
              prefixIcon: Icon(Icons.search_outlined),
              border: InputBorder.none,
            ),
          ),
          ContactList(
            searchQuery: _searchQuery,
            onAddCustomer: (contact) {
              Customer newCustomer = Customer(
                contact.displayName ?? 'Unknown',
                0,
              );
              Navigator.pop(context, newCustomer);
            },
          ),
        ],
      ),
    );
  }
}

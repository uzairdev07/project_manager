import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/widgtes/customer_item.dart';

class CustomerList extends StatefulWidget {
  final List<Customer> customers;

  CustomerList({required this.customers, Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.customers.length,
      itemBuilder: (context, index) {
        final customer = widget.customers[index];
        return Slidable(
          key: Key(customer.getName),
          endActionPane: ActionPane(
            motion: const BehindMotion(),
            dismissible: DismissiblePane(
              onDismissed: () => _onDelete(index, Actions.delete),
            ),
            children: [
              SlidableAction(
                onPressed: (context) => _onDelete(index, Actions.delete),
                backgroundColor: Colors.red.shade300,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: CustomerItem(customer: customer),
        );
      },
    );
  }

  void _onDelete(int index, Actions actions) {
    final customer = widget.customers[index];
    setState(() {
      widget.customers.removeAt(index);
    });
    _showSnackBar(
      context,
      '${customer.getName} has been deleted',
      Colors.red.shade300,
      onUndo: () {
        setState(() {
          widget.customers.add(customer);
        });
      },
    );
  }

  void _showSnackBar(BuildContext context, String message, Color color,
      {VoidCallback? onUndo}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () => onUndo,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

enum Actions {
  delete,
}

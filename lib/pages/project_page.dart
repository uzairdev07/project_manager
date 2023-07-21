import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:khata_app/models/Project.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/pages/add_customer_project.dart';
import 'package:khata_app/pages/customer_projects_page.dart';
import 'package:khata_app/widgtes/total_money_button.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Customer> customers = [];

  void _navigateToAddCustomer() async {
    final Customer? newCustomer = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddCustomerProjectPage(),
      ),
    );

    if (newCustomer != null) {
      setState(() {
        customers.add(newCustomer);
      });
    }
  }

  void _navigateToCustomerProjectPage(Customer customer) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomerProjectPage(
          customer: customer,
        ),
      ),
    );

    if (result != null && result is Customer) {
      int index = customers.indexWhere((c) => c.getName == result.getName);
      if (index != -1) {
        setState(() {
          customers[index] = result;
        });
      }
    }
  }

  double totalAmountToGet() {
    double result = 0;
    for (Customer customer in customers) {
      for (Project project in customer.projects) {
        result += project.remaining;
      }
    }
    return result;
  }

  double totalAmountReceived() {
    double result = 0;
    for (Customer customer in customers) {
      for (Project project in customer.projects) {
        result += project.getReceived();
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TotalMoneyButton(
                          label: 'To Get',
                          money: totalAmountToGet(),
                          icon: Icons.arrow_downward,
                          textColor: Colors.red,
                          bgColor: Colors.red.withOpacity(0.2),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TotalMoneyButton(
                          label: 'Received',
                          money: totalAmountReceived(),
                          icon: Icons.arrow_upward,
                          textColor: Colors.green,
                          bgColor: Colors.green.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
                const TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Search Customer',
                    prefixIcon: Icon(Icons.search_outlined),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: customers.length,
                    itemBuilder: (context, index) {
                      final customer = customers[index];
                      return Slidable(
                        key: Key(customer.getName),
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () => _onDelete(index, Actions.delete),
                          ),
                          children: [
                            SlidableAction(
                              onPressed: (context) =>
                                  _onDelete(index, Actions.delete),
                              backgroundColor: Colors.red.shade300,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(customer.getName),
                          onTap: () {
                            _navigateToCustomerProjectPage(customer);
                          },
                          leading: const Icon(Icons.person),
                          trailing: Text('${customer.totalAmount()}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: _navigateToAddCustomer,
                label: const Text('ADD CUSTOMER'),
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDelete(int index, Actions actions) {
    final customer = customers[index];
    setState(() {
      customers.removeAt(index);
    });
    _showSnackBar(
      context,
      '${customer.getName} has been deleted',
      Colors.red.shade300,
      onUndo: () {
        setState(() {
          customers.add(customer);
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

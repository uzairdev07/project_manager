import 'package:flutter/material.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/pages/add_customer_project.dart';
import 'package:khata_app/widgtes/customer_list.dart';
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
        builder: (context) => AddCustomerProjectPage(),
      ),
    );

    if (newCustomer != null) {
      setState(() {
        customers.add(newCustomer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TotalMoneyButton(
                        money: 0,
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
                        money: 0,
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
              Expanded(child: CustomerList(customers: customers)),
            ],
          ),
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: _navigateToAddCustomer,
                label: const Text('ADD PROJECT'),
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
}

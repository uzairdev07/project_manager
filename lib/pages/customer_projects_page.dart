import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/pages/add_project_page.dart';
import 'package:khata_app/widgtes/project_list.dart';
import 'package:khata_app/widgtes/text_icon.dart';
import 'package:khata_app/widgtes/total_money_button.dart';

class CustomerProjectPage extends StatefulWidget {
  Customer customer;

  CustomerProjectPage({super.key, required this.customer});

  @override
  State<CustomerProjectPage> createState() => _CustomerProjectPageState();
}

class _CustomerProjectPageState extends State<CustomerProjectPage> {
  void _navigateToAddProjectPage() async {
    Map<String, dynamic> result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddProjectPage(
          customer: widget.customer,
        ),
      ),
    );

    if (result != null) {
      Customer updatedCustomer = result['customer'];

      setState(() {
        widget.customer = updatedCustomer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.customer.getName),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
          child: Stack(
            children: [
              Column(
                children: [
                  TotalMoneyButton(
                    money: widget.customer.getTotal,
                    icon: Icons.arrow_downward_outlined,
                    textColor: widget.customer.getTotal == 0
                        ? Colors.green
                        : Colors.red,
                    bgColor: widget.customer.getTotal == 0
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextIcon(
                        icon: const Icon(
                          Icons.message_outlined,
                          color: Colors.deepPurple,
                        ),
                        title: const Text('SMS'),
                      ),
                      TextIcon(
                        icon: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green,
                        ),
                        title: const Text('WhatsApp'),
                      ),
                      TextIcon(
                        icon: const Icon(
                          FontAwesomeIcons.filePdf,
                          color: Colors.blue,
                        ),
                        title: const Text('Reports'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Expanded(child: ProjectList(customer: widget.customer)),
                ],
              ),
              Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed: _navigateToAddProjectPage,
                    label: const Text('ADD PROJECT'),
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

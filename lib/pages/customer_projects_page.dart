import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khata_app/models/customer.dart';
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
          child: Column(
            children: [
              TotalMoneyButton(
                money: widget.customer.getPayment,
                icon: Icons.arrow_downward_outlined,
                textColor: Colors.red,
                bgColor: Colors.red.withOpacity(0.2),
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
                      color: Colors.blue,
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
              ProjectList(customer: widget.customer),
            ],
          ),
        ),
      ),
    );
  }
}

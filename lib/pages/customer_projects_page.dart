import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/models/Project.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/pages/add_project_page.dart';
import 'package:khata_app/widgtes/text_icon.dart';
import 'package:khata_app/widgtes/total_money_button.dart';

import 'payments_page.dart';

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
      updatedCustomer.setTotal = widget.customer.totalAmount();
      setState(() {
        widget.customer = updatedCustomer;
      });
    }
  }

  void _navigateToPaymentsPage(Project project) async {
    Project updatedProject = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PaymentsPage(
          project: project,
        ),
      ),
    );
    if (updatedProject != null) {
      setState(() {
        int index = widget.customer.projects
            .indexWhere((p) => p.getDateTime == updatedProject.getDateTime);
        if (index != -1) {
          widget.customer.projects[index] = updatedProject;
        }
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
            Navigator.of(context).pop(widget.customer);
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
                    money: widget.customer.totalAmount(),
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
                  Expanded(
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text('Date'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Budget',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Received',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.customer.projects.length,
                            itemBuilder: (context, index) {
                              Project project =
                                  widget.customer.projects.elementAt(index);
                              String formattedDateTime =
                                  DateFormat("d MMM, yy h:mm a")
                                      .format(project.getDateTime);
                              double remaining =
                                  project.getBudget - project.getReceived();
                              return GestureDetector(
                                onTap: () => _navigateToPaymentsPage(project),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  formattedDateTime,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  project.getDesc,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 2.0,
                                                      horizontal: 4.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.shade50,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child:
                                                      Text('Bal. $remaining'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Rs. ${project.getBudget}',
                                              style: const TextStyle(
                                                color: Colors.red,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Rs. ${project.getReceived()}',
                                              style: const TextStyle(
                                                color: Colors.green,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}

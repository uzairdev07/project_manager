import 'package:flutter/material.dart';
import 'package:khata_app/models/customer.dart';
import 'package:khata_app/pages/payments_page.dart';
import 'package:khata_app/widgtes/project_cell.dart';

class ProjectList extends StatefulWidget {
  Customer customer;
  ProjectList({super.key, required this.customer});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              return GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentsPage(
                        project: widget.customer.projects.elementAt(index),
                      ),
                    ),
                  ),
                },
                child: ProjectCell(
                  project: widget.customer.projects.elementAt(index),
                ),
              );
              // double remainingAmount =
              //     customer.projects.elementAt(index).getBudget -
              //         customer.projects.elementAt(index).getReceived();
              // return Slidable(
              //   key: Key(customer.projects.elementAt(index).getDesc),
              //   endActionPane: ActionPane(
              //     motion: const BehindMotion(),
              //     children: [
              //       SlidableAction(
              //         onPressed: (context) =>
              //             _onPayAction(context, remainingAmount, index),
              //         backgroundColor: Colors.green.shade300,
              //         icon: Icons.payment_outlined,
              //         label: 'Pay',
              //       ),
              //     ],
              //   ),
            },
          ),
        ),
      ],
    );
  }
}

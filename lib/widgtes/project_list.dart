import 'package:flutter/material.dart';
import 'package:khata_app/models/customer.dart';

class ProjectList extends StatelessWidget {
  Customer customer;
  ProjectList({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
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
                'Maine diye',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'Maine liye',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

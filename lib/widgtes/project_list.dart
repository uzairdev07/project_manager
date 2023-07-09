import 'package:flutter/material.dart';
import 'package:khata_app/widgtes/project_cell.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

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
        ProjectCell(),
        Divider(),
        ProjectCell(),
        Divider(),
        ProjectCell(),
      ],
    );
  }
}

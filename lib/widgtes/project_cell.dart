import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/models/Project.dart';

class ProjectCell extends StatelessWidget {
  Project project;

  ProjectCell({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
        DateFormat("d MMM, yy h:mm a").format(project.getDateTime);
    double remaining = project.getBudget - project.getReceived();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text('Bal. $remaining'),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:khata_app/models/Project.dart';

class ProjectCell extends StatelessWidget {
  Project project;

  ProjectCell({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1st June, 11:14 AM',
              ),
              const Text(
                'Java Distinct Cities + Report',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: const Text(
                  'Bal Rs. 52,500',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Expanded(
          flex: 3,
          child: Text(
            'Rs. 52,000',
            textAlign: TextAlign.center,
          ),
        ),
        const Expanded(
          flex: 3,
          child: Text(
            'Rs. 52,000',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

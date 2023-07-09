import 'package:flutter/material.dart';

class ProjectCell extends StatelessWidget {
  const ProjectCell({Key? key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1st June, 11:14 AM',
                ),
                Text(
                  'Java Distinct Cities + Report',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    'Bal Rs. 52,500',
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Rs. 52,000',
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
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

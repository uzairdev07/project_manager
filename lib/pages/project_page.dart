import 'package:flutter/material.dart';
import 'package:khata_app/widgtes/contact_list.dart';
import 'package:khata_app/widgtes/total_money_button.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

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
              const ContactList(),
            ],
          ),
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khata_app/models/Project.dart';

class PayBottomSheet extends StatefulWidget {
  final ValueSetter<double> onPay;
  Project project;

  PayBottomSheet({super.key, required this.onPay, required this.project});

  @override
  _PayBottomSheetState createState() => _PayBottomSheetState();
}

class _PayBottomSheetState extends State<PayBottomSheet> {
  final TextEditingController _amountController = TextEditingController();
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              onChanged: (text) {
                amount = text;
              },
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Enter Amount',
                prefixText: 'RS. ',
                prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                String amountText = _amountController.text;
                if (amountText.isNotEmpty) {
                  double amount = double.parse(amountText);
                  widget.onPay(amount);
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.green),
              ),
              icon: const Icon(
                Icons.payment_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'Pay',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

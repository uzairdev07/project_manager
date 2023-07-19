import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:khata_app/models/Payment.dart';
import 'package:khata_app/models/Project.dart';

class PaymentsPage extends StatefulWidget {
  Project project;
  PaymentsPage({super.key, required this.project});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  TextEditingController amountController = TextEditingController();

  void _addPayment() {
    double amount = double.parse(amountController.text);
    if (amount > 0) {
      DateTime currentDateTime = DateFormat("dd MMM, yy hh:mm a")
          .parse(_getCurrentFormattedDateTime());
      final payment = Payment(amount, currentDateTime);
      widget.project.addPayment(payment);
      setState(() {});
      Navigator.of(context).pop(widget.project);
    }
  }

  String _getCurrentFormattedDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat("dd MMM, yy hh:mm a");
    return formatter.format(now);
  }

  bool _isAmountValid() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    double remainingBudget =
        widget.project.getBudget - widget.project.getReceived();
    return amount > 0 && amount <= remainingBudget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: amountController,
                        decoration: const InputDecoration(
                          labelText: 'Pay Amount',
                          prefixText: 'RS. ',
                          prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: ElevatedButton.icon(
                      onPressed: _addPayment,
                      icon: const Icon(Icons.payment_outlined),
                      label: const Text('Pay'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                itemCount: widget.project.getPayments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.payment_outlined),
                    title: Text(widget.project.getDesc),
                    trailing: Text(
                      'Rs. ${widget.project.getPayments.elementAt(index).getPay}',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

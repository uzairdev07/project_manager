import 'package:flutter/material.dart';

class TotalMoneyButton extends StatefulWidget {
  double money;
  IconData? icon;
  Color? textColor;
  Color? bgColor;
  String label;

  TotalMoneyButton(
      {super.key,
      required this.money,
      required this.label,
      required this.icon,
      required this.textColor,
      required this.bgColor});

  @override
  State<TotalMoneyButton> createState() => _TotalMoneyButtonState();
}

class _TotalMoneyButtonState extends State<TotalMoneyButton> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: widget.bgColor?.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 16.0,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rs. ' + widget.money.toString(),
                    style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

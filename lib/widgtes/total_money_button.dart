import 'package:flutter/material.dart';

class TotalMoneyButton extends StatefulWidget {
  IconData? icon;
  Color? textColor;
  Color? bgColor;

  TotalMoneyButton(
      {super.key,
      required this.icon,
      required this.textColor,
      required this.bgColor});

  @override
  State<TotalMoneyButton> createState() => _TotalMoneyButtonState();
}

class _TotalMoneyButtonState extends State<TotalMoneyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 50,
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
          Column(
            children: [
              Text(
                'Rs. 92,208',
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Maine lene hain',
                style: TextStyle(
                  fontSize: 10.0,
                  color: widget.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

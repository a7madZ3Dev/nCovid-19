import 'package:flutter/material.dart';

class QuoteWidget extends StatelessWidget {
  final String quote;
  const QuoteWidget({
    required this.quote,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.orange[100],
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10.0),
        child: Text(
          quote,
          style: TextStyle(
            color: Colors.orange[800],
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}

import 'package:flutter/material.dart';

import '/core/utils/colors.dart';

class RowPanel extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String? subTitle;

  const RowPanel(
      {required this.onTap, required this.title, this.subTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
          color: kprimaryBlack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  if (subTitle != null)
                    TextSpan(
                      text: subTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontSize: 14),
                    )
                  else
                    const TextSpan(),
                ]),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      );
}

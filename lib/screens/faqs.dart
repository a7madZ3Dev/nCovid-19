import 'dart:ui';

import 'package:flutter/material.dart';

import '/core/utils/colors.dart';
import '/core/utils/questions_and_answers.dart';

class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('FAQs'),
          centerTitle: true,
          backgroundColor: kprimaryBlack,
        ),
        body: ListView.builder(
          itemCount: questionAnswers.length,
          itemBuilder: (context, index) => ExpansionTile(
            childrenPadding: const EdgeInsets.all(10.0),
            collapsedIconColor: kprimaryBlack,
            tilePadding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
            title: Text(
              questionAnswers[index]['question']!,
              style: const TextStyle(fontWeight: FontWeight.bold, height: 1.2),
            ),
            children: <Widget>[
              Text(
                questionAnswers[index]['answer']!,
                style: const TextStyle(height: 1.5),
              )
            ],
          ),
        ),
      );
}

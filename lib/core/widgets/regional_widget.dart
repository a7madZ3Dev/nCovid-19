import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/utils/colors.dart';
import '/screens/country.dart';

class RegionalWidget extends StatelessWidget {
  const RegionalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Get.to(
          () => const Country(),
          transition: Transition.rightToLeftWithFade,
        ),
        child: Container(
          decoration: BoxDecoration(
              color: kprimaryBlack, borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Regional',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
}

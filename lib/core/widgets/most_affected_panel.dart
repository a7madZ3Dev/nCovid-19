import 'package:flutter/material.dart';

import '/core/widgets/most_aff_single_item.dart';
import '/models/most_affected.dart';

class MostAffectedPanel extends StatelessWidget {
  final List<CountryData> countryData;
  const MostAffectedPanel({
    required this.countryData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(4.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: countryData.length,
          itemBuilder: (context, index) =>
              MostAffectedSingleItem(countryData: countryData[index]),
        ),
      );
}

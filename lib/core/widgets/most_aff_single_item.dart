import 'package:flutter/material.dart';

import '/core/utils/extenstions.dart';
import '/models/most_affected.dart';

class MostAffectedSingleItem extends StatelessWidget {
  final CountryData countryData;
  const MostAffectedSingleItem({
    required this.countryData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (countryData.countryInfo!.flag!.isNotEmpty)
              FadeInImage(
                height: 25.0,
                width: 40.0,
                fit: BoxFit.fill,
                placeholder: const AssetImage(
                  'assets/images/placeholder.png',
                ),
                placeholderErrorBuilder: (context, error, stackTrace) =>
                    const Text('data'),
                image: NetworkImage(
                  countryData.countryInfo!.flag!,
                ),
                imageErrorBuilder: (context, error, stackTrace) => const Image(
                  image: AssetImage(
                    'assets/images/placeholder.png',
                  ),
                  height: 25.0,
                  width: 40.0,
                  fit: BoxFit.fill,
                ),
              )
            else
              const Image(
                image: AssetImage(
                  'assets/images/placeholder.png',
                ),
                height: 25.0,
                width: 40.0,
                fit: BoxFit.fill,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                countryData.country!.capitalize,
                style: const TextStyle(fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Text(
                'Cases: ${countryData.cases}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Deaths: ${countryData.deaths}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}

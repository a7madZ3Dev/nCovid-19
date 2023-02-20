import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/core/utils/extenstions.dart';
import '/models/most_affected.dart';

class CountryRow extends StatelessWidget {
  final CountryData countryData;
  const CountryRow({required this.countryData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Container(
          height: 130,
          margin: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          countryData.country!.capitalize,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (countryData.countryInfo!.flag!.isNotEmpty)
                        FadeInImage(
                          height: 80,
                          fit: BoxFit.fill,
                          placeholder: const AssetImage(
                            'assets/images/placeholder.png',
                          ),
                          image: NetworkImage(
                            countryData.countryInfo!.flag!,
                          ),
                          imageErrorBuilder: (context, error, stackTrace) =>
                              const Image(
                            image: AssetImage(
                              'assets/images/placeholder.png',
                            ),
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        )
                      else
                        const Image(
                          image: AssetImage(
                            'assets/images/placeholder.png',
                          ),
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '⦿ CONFIRMED: ${countryData.cases}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '⦿ ACTIVE: ${countryData.active}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '⦿ RECOVERED: ${countryData.recovered}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                        Text(
                          '⦿ DEATHS: ${countryData.deaths}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey[100]
                                  : Colors.grey[900]),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
}

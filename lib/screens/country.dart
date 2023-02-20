import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/utils/colors.dart';
import '/core/widgets/country_row.dart';
import '/core/widgets/separated.dart';
import '/providers/data.dart';
import '/screens/search.dart';

class Country extends StatelessWidget {
  const Country({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryBlack,
          title: const Text('Countries Stats'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: Search(
                        allCountries: Provider.of<Data>(context, listen: false)
                            .allCountries));
              },
            )
          ],
        ),
        body: Provider.of<Data>(context, listen: false).allCountries.isNotEmpty
            ? Consumer<Data>(
                builder: (context, data, _) => ListView.separated(
                  itemCount: data.allCountries.length,
                  separatorBuilder: (context, index) => const SeparatedWidget(),
                  itemBuilder: (context, index) =>
                      CountryRow(countryData: data.allCountries[index]),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).brightness == Brightness.light
                        ? kprimaryBlack
                        : Colors.white),
              ),
      );
}

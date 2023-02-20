import 'package:flutter/material.dart';

import '/core/widgets/country_row.dart';
import '/models/most_affected.dart';

class Search extends SearchDelegate {
  late final List<CountryData> allCountries;

  Search({required this.allCountries});

  /// action for appBar
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              query = '';
            }),
      ];

  /// Icon Leading
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      });

  @override
  Widget buildResults(BuildContext context) => Container();

  /// show Suggestion when someone search about something
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? allCountries
        : allCountries
            .where((element) => element.country!.contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, index) => CountryRow(countryData: suggestionList[index]),
    );
  }
}

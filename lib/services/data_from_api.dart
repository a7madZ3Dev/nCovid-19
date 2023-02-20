import 'dart:convert';

import 'package:http/http.dart' as http;

import '/models/most_affected.dart';
import '/models/world_wide_api.dart';

class DataFromApi {
  Future<WorldWideValues> fetchDataWorldWide() async {
    const url = 'https://disease.sh/v3/covid-19/all';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data =
          WorldWideValues.fromJson(json: jsonData as Map<String, dynamic>);
      return data;
    } else {
      throw response;
    }
  }

  Future<List<CountryData>> fetchDataOfCountries() async {
    const url = 'https://disease.sh/v3/covid-19/countries?sort=cases';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List;

      return jsonData
          .map<CountryData>((item) =>
              CountryData.fromJson(json: item as Map<String, dynamic>))
          .toList();
    } else {
      throw response;
    }
  }
}

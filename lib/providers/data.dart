import 'dart:io';

import 'package:flutter/material.dart';

import '/core/utils/constants.dart';
import '/core/widgets/show_alert_dialog.dart';
import '/models/most_affected.dart';
import '/models/status_panel.dart';
import '/services/data_cache_helper.dart';
import '/services/data_from_api.dart';
import '/services/data_helper.dart';

class Data extends ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  bool? hasInternet;

  List<StatusPanel> _worldWide = [];

  List<StatusPanel> get worldWide => [..._worldWide];

  Future<void> fetchDataWorldWide() async {
    await DataFromApi().fetchDataWorldWide().then((value) async {
      await CacheHelper.saveDataWorldWide(values: value);
      _worldWide = [
        StatusPanel(
          title: 'CONFIRMED',
          panelColor: Colors.red[100],
          textColor: Colors.red,
          count: value.cases ?? 0,
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.blue[100],
          textColor: Colors.blue[900],
          count: value.active ?? 0,
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green[100],
          textColor: Colors.green,
          count: value.recovered ?? 0,
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.grey[400],
          textColor: Colors.grey[900],
          count: value.deaths ?? 0,
        ),
      ];
      notifyListeners();
    }).catchError((error) async {
      if (_worldWide.isEmpty) {
        final value = await CacheHelper.getDataWorldWide();
        _worldWide = [
          StatusPanel(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: value.cases ?? 0,
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: value.active ?? 0,
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: value.recovered ?? 0,
          ),
          StatusPanel(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: value.deaths ?? 0,
          ),
        ];
      }
      notifyListeners();
      throw SocketException(error.toString());
    });
  }

  List<CountryData> _mostAffected = [];

  List<CountryData> get mostAffected => [..._mostAffected];

  List<CountryData> _allCountries = [];

  List<CountryData> get allCountries => [..._allCountries];

  Future<void> fetchDataOfCountries() async {
    await DataFromApi().fetchDataOfCountries().then((value) async {
      await dbHelper.deleteRows();
      for (final item in value) {
        await dbHelper.insertRow({
          kCountryName: item.country!,
          kCountryFlag: item.countryInfo!.flag!,
          kCountryCases: item.cases!,
          kCountryDeathes: item.deaths!,
          kCountryActive: item.active!,
          kCountryRecovered: item.recovered!,
        });
      }
      _mostAffected.clear();
      _allCountries.clear();
      _allCountries = value;
      _mostAffected = value.take(5).toList();
      notifyListeners();
    }).catchError((error) async {
      final allRows = await dbHelper.getRows();
      if (_mostAffected.isEmpty || _allCountries.isEmpty) {
        for (var i = 0; i < allRows.length; i++) {
          if (0 <= i && i <= 4) {
            _mostAffected.add(CountryData(
              country: allRows[i][kCountryName] as String,
              countryInfo: CountryInfo(flag: ''),
              cases: allRows[i][kCountryCases] as int,
              deaths: allRows[i][kCountryDeathes] as int,
              active: allRows[i][kCountryActive] as int,
              recovered: allRows[i][kCountryRecovered] as int,
            ));
          }

          _allCountries.add(CountryData(
            country: allRows[i][kCountryName] as String,
            countryInfo: CountryInfo(flag: ''),
            cases: allRows[i][kCountryCases] as int,
            deaths: allRows[i][kCountryDeathes] as int,
            active: allRows[i][kCountryActive] as int,
            recovered: allRows[i][kCountryRecovered] as int,
          ));
        }
      }
      notifyListeners();
      throw SocketException(error.toString());
    });
  }

  /// get all data
  Future<void> updateData(BuildContext context) async {
    try {
      await Future.wait<void>([
        fetchDataWorldWide(),
        fetchDataOfCountries(),
      ]);
    } on SocketException catch (_) {
      /// internet cut
      await showAlertDialog(
        context: context,
        title: 'Connection Error',
        content: 'Could not retrieve data. Please try again later.',
        defaultActionText: 'OK',
      );
      // exit(0);
    }
  }
}

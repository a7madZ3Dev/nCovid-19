class CountryData {
  final String? country;
  final CountryInfo? countryInfo;
  final int? cases;
  final int? deaths;
  final int? active;
  final int? recovered;

  CountryData(
      {this.active,
      this.recovered,
      this.country,
      this.countryInfo,
      this.cases,
      this.deaths});

  factory CountryData.fromJson({required Map<String, dynamic> json}) =>
      CountryData(
        country: (json['country'] as String).toLowerCase(),
        cases: json['cases'] as int,
        deaths: json['deaths'] as int,
        active: json['active'] as int,
        recovered: json['recovered'] as int,
        countryInfo: json['countryInfo'] != null
            ? CountryInfo.fromJson(json['countryInfo'] as Map<String, dynamic>)
            : null,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['country'] = country;
    data['cases'] = cases;
    data['deaths'] = deaths;
    data['active'] = active;
    data['recovered'] = recovered;
    if (countryInfo != null) {
      data['countryInfo'] = countryInfo?.toJson();
    }
    return data;
  }
}

class CountryInfo {
  final String? flag;

  CountryInfo({this.flag});

  factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        flag: json['flag'] as String,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['flag'] = flag;
    return data;
  }
}

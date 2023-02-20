class WorldWideValues {
  final int? cases;
  final int? deaths;
  final int? recovered;
  final int? active;

  WorldWideValues({this.cases, this.deaths, this.recovered, this.active});

  factory WorldWideValues.fromJson({required Map<String, dynamic> json}) =>
      WorldWideValues(
        cases: json['cases'] as int,
        deaths: json['deaths'] as int,
        recovered: json['recovered'] as int,
        active: json['active'] as int,
      );

  Map<String, int> toJson() {
    final data = <String, int>{};
    data['cases'] = cases!;
    data['deaths'] = deaths!;
    data['recovered'] = recovered!;
    data['active'] = active!;
    return data;
  }
}

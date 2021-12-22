class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoUrl,
    required this.name,
    required this.originCountry,
  });

  int id;
  String logoUrl;
  String name;
  String originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoUrl: json["logo_url"] ?? "",
        name: json["name"],
        originCountry: json["origin_country"],
      );
}

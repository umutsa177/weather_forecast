class Coord {
  int? lon;
  double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'] as int?,
        lat: (json['lat'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };
}

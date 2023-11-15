class Geocoding {
  final String name;
  final String street;

  Geocoding({required this.name, required this.street});

  factory Geocoding.fromJson(Map<String, dynamic> json) =>
      Geocoding(name: json['name'], street: json['street']);
}

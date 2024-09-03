class Toilet {
  final String id;
  final String address;
  final String cleanliness;
  final double priceForPoop;
  final double priceForPee;
  final double priceForShower;
  final double latitude;
  final double longitude;
  final List<String> amenities;
  final String additionalNotes;
  final String status;
  final List<String> photos;

  Toilet({
    required this.id,
    required this.address,
    required this.cleanliness,
    required this.priceForPoop,
    required this.priceForPee,
    required this.priceForShower,
    required this.latitude,
    required this.longitude,
    required this.amenities,
    required this.additionalNotes,
    required this.status,
    required this.photos,
  });

  factory Toilet.fromJson(Map<String, dynamic> json) {
    return Toilet(
      id: json['id'].toString(),
      address: json['address'],
      cleanliness: json['cleanliness'],
      priceForPoop: double.parse(json['price_for_poop']),
      priceForPee: double.parse(json['price_for_pee']),
      priceForShower: double.parse(json['price_for_shower']),
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      amenities: List<String>.from(json['amenities']),
      additionalNotes: json['additional_notes'],
      status: json['status'],
      photos: List<String>.from(json['photos']),
    );
  }
}

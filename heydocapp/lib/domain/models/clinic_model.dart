// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClinicModel {
  String clinicName;
  String doctorName;
  String doctorImage;
  String lat;
  String lng;
  String pictureLink;
  String phoneNumber;
  String description;
  String rating;
  String doctorUid;
  String price;

  ClinicModel({
    required this.clinicName,
    required this.doctorName,
    required this.doctorImage,
    required this.lat,
    required this.lng,
    required this.pictureLink,
    required this.phoneNumber,
    required this.description,
    required this.rating,
    required this.doctorUid,
    required this.price,
  });

  ClinicModel copyWith({
    String? clinicName,
    String? doctorName,
    String? doctorImage,
    String? lat,
    String? lng,
    String? pictureLink,
    String? phoneNumber,
    String? description,
    String? rating,
    String? doctorUid,
    String? price,
  }) {
    return ClinicModel(
      clinicName: clinicName ?? this.clinicName,
      doctorName: doctorName ?? this.doctorName,
      doctorImage: doctorImage ?? this.doctorImage,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      pictureLink: pictureLink ?? this.pictureLink,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      doctorUid: doctorUid ?? this.doctorUid,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clinicName': clinicName,
      'doctorName': doctorName,
      'doctorImage': doctorImage,
      'lat': lat,
      'lng': lng,
      'pictureLink': pictureLink,
      'phoneNumber': phoneNumber,
      'description': description,
      'rating': rating,
      'doctorUid': doctorUid,
      'price': price,
    };
  }

  factory ClinicModel.fromMap(Map<String, dynamic> map) {
    return ClinicModel(
      clinicName: map['clinicName'] as String,
      doctorName: map['doctorName'] as String,
      doctorImage: map['doctorImage'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
      pictureLink: map['pictureLink'] as String,
      phoneNumber: map['phoneNumber'] as String,
      description: map['description'] as String,
      rating: map['rating'] as String,
      doctorUid: map['doctorUid'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClinicModel.fromJson(String source) =>
      ClinicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClinicModel(clinicName: $clinicName, doctorName: $doctorName, doctorImage: $doctorImage, lat: $lat, lng: $lng, pictureLink: $pictureLink, phoneNumber: $phoneNumber, description: $description, rating: $rating, doctorUid: $doctorUid, price: $price)';
  }

  @override
  bool operator ==(covariant ClinicModel other) {
    if (identical(this, other)) return true;

    return other.clinicName == clinicName &&
        other.doctorName == doctorName &&
        other.doctorImage == doctorImage &&
        other.lat == lat &&
        other.lng == lng &&
        other.pictureLink == pictureLink &&
        other.phoneNumber == phoneNumber &&
        other.description == description &&
        other.rating == rating &&
        other.doctorUid == doctorUid &&
        other.price == price;
  }

  @override
  int get hashCode {
    return clinicName.hashCode ^
        doctorName.hashCode ^
        doctorImage.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        pictureLink.hashCode ^
        phoneNumber.hashCode ^
        description.hashCode ^
        rating.hashCode ^
        doctorUid.hashCode ^
        price.hashCode;
  }
}

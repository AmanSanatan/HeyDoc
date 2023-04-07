// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'booking_model.dart';

class PatientModel {
  String name;
  String email;
  String pictureLink;
  List<BookingModel>? bookings;
  String uid;
  String isDoctor;
  PatientModel({
    required this.name,
    required this.email,
    this.pictureLink =
        'https://wallpapers.com/images/hd/mellow-beluga-cat-w5m9sbsnv4t4osjr.jpg',
    this.bookings,
    required this.uid,
    required this.isDoctor,
  });

  PatientModel copyWith({
    String? name,
    String? email,
    String? pictureLink,
    List<BookingModel>? bookings,
    String? uid,
    String? isDoctor,
  }) {
    return PatientModel(
      name: name ?? this.name,
      email: email ?? this.email,
      pictureLink: pictureLink ?? this.pictureLink,
      bookings: bookings ?? this.bookings,
      uid: uid ?? this.uid,
      isDoctor: isDoctor ?? this.isDoctor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'pictureLink': pictureLink,
      'bookings': bookings?.map((x) => x.toMap()).toList(),
      'uid': uid,
      'isDoctor': isDoctor,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      name: map['name'] as String,
      email: map['email'] as String,
      pictureLink: map['pictureLink'] as String,
      bookings: map['bookings'] != null
          ? List<BookingModel>.from(
              (map['bookings'] as List<dynamic>).map<BookingModel?>(
                (x) => BookingModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      uid: map['uid'] as String,
      isDoctor: map['isDoctor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) =>
      PatientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientModel(name: $name, email: $email, pictureLink: $pictureLink, bookings: $bookings, uid: $uid, isDoctor: $isDoctor)';
  }

  @override
  bool operator ==(covariant PatientModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.pictureLink == pictureLink &&
        listEquals(other.bookings, bookings) &&
        other.uid == uid &&
        other.isDoctor == isDoctor;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        pictureLink.hashCode ^
        bookings.hashCode ^
        uid.hashCode ^
        isDoctor.hashCode;
  }
}

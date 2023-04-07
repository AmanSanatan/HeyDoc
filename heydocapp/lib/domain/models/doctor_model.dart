// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'booking_model.dart';
import 'clinic_model.dart';

class DoctorModel {
  String name;
  String email;
  String pictureLink;
  ClinicModel clinic;
  List<BookingModel>? bookings;
  String uid;
  String balance;
  DoctorModel({
    required this.name,
    required this.email,
    required this.pictureLink,
    required this.clinic,
    this.bookings,
    required this.uid,
    required this.balance,
  });

  DoctorModel copyWith({
    String? name,
    String? email,
    String? pictureLink,
    ClinicModel? clinic,
    List<BookingModel>? bookings,
    String? uid,
    String? balance,
  }) {
    return DoctorModel(
      name: name ?? this.name,
      email: email ?? this.email,
      pictureLink: pictureLink ?? this.pictureLink,
      clinic: clinic ?? this.clinic,
      bookings: bookings ?? this.bookings,
      uid: uid ?? this.uid,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'pictureLink': pictureLink,
      'clinic': clinic.toMap(),
      'bookings': bookings?.map((x) => x.toMap()).toList(),
      'uid': uid,
      'balance': balance,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      name: map['name'] as String,
      email: map['email'] as String,
      pictureLink: map['pictureLink'] as String,
      clinic: ClinicModel.fromMap(map['clinic'] as Map<String, dynamic>),
      bookings: map['bookings'] != null
          ? List<BookingModel>.from(
              (map['bookings'] as List<dynamic>).map<BookingModel?>(
                (x) => BookingModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      uid: map['uid'] as String,
      balance: map['balance'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorModel(name: $name, email: $email, pictureLink: $pictureLink, clinic: $clinic, bookings: $bookings, uid: $uid, balance: $balance)';
  }

  @override
  bool operator ==(covariant DoctorModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.pictureLink == pictureLink &&
        other.clinic == clinic &&
        listEquals(other.bookings, bookings) &&
        other.uid == uid &&
        other.balance == balance;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        pictureLink.hashCode ^
        clinic.hashCode ^
        bookings.hashCode ^
        uid.hashCode ^
        balance.hashCode;
  }
}

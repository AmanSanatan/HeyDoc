// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookingModel {
  String date;
  String time;
  String meetLink;
  String patientName;
  String doctorName;
  String doctorId;
  String patientId;
  String clinicName;
  String cost;
  BookingModel({
    required this.date,
    required this.time,
    required this.meetLink,
    required this.patientName,
    required this.doctorName,
    required this.doctorId,
    required this.patientId,
    required this.clinicName,
    required this.cost,
  });

  BookingModel copyWith({
    String? date,
    String? time,
    String? meetLink,
    String? patientName,
    String? doctorName,
    String? doctorId,
    String? patientId,
    String? clinicName,
    String? cost,
  }) {
    return BookingModel(
      date: date ?? this.date,
      time: time ?? this.time,
      meetLink: meetLink ?? this.meetLink,
      patientName: patientName ?? this.patientName,
      doctorName: doctorName ?? this.doctorName,
      doctorId: doctorId ?? this.doctorId,
      patientId: patientId ?? this.patientId,
      clinicName: clinicName ?? this.clinicName,
      cost: cost ?? this.cost,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'time': time,
      'meetLink': meetLink,
      'patientName': patientName,
      'doctorName': doctorName,
      'doctorId': doctorId,
      'patientId': patientId,
      'clinicName': clinicName,
      'cost': cost,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      date: map['date'] as String,
      time: map['time'] as String,
      meetLink: map['meetLink'] as String,
      patientName: map['patientName'] as String,
      doctorName: map['doctorName'] as String,
      doctorId: map['doctorId'] as String,
      patientId: map['patientId'] as String,
      clinicName: map['clinicName'] as String,
      cost: map['cost'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookingModel.fromJson(String source) =>
      BookingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookingModel(date: $date, time: $time, meetLink: $meetLink, patientName: $patientName, doctorName: $doctorName, doctorId: $doctorId, patientId: $patientId, clinicName: $clinicName, cost: $cost)';
  }

  @override
  bool operator ==(covariant BookingModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.time == time &&
        other.meetLink == meetLink &&
        other.patientName == patientName &&
        other.doctorName == doctorName &&
        other.doctorId == doctorId &&
        other.patientId == patientId &&
        other.clinicName == clinicName &&
        other.cost == cost;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        time.hashCode ^
        meetLink.hashCode ^
        patientName.hashCode ^
        doctorName.hashCode ^
        doctorId.hashCode ^
        patientId.hashCode ^
        clinicName.hashCode ^
        cost.hashCode;
  }
}

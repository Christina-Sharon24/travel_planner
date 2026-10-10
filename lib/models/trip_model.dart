import 'package:cloud_firestore/cloud_firestore.dart';

class TripModel {
  final String? id;
  final String userId;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final int travellerCount;
  final String travelType;
  final double budget;
  final String budgetCurrency;
  final int durationDays;
  final DateTime createdAt;
  final DateTime updatedAt;

  TripModel({
    this.id,
    required this.userId,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.travellerCount,
    this.travelType = 'leisure',
    required this.budget,
    this.budgetCurrency = 'INR',
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : durationDays = endDate.difference(startDate).inDays + 1,
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'destination': destination,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'travellerCount': travellerCount,
      'travelType': travelType,
      'budget': budget,
      'budgetCurrency': budgetCurrency,
      'durationDays': durationDays,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory TripModel.fromMap(String id, Map<String, dynamic> map) {
    return TripModel(
      id: id,
      userId: map['userId'] ?? '',
      destination: map['destination'] ?? '',
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
      travellerCount: map['travellerCount'] ?? 1,
      travelType: map['travelType'] ?? 'leisure',
      budget: (map['budget'] ?? 0).toDouble(),
      budgetCurrency: map['budgetCurrency'] ?? 'INR',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  TripModel copyWith({
    String? id,
    String? userId,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    int? travellerCount,
    String? travelType,
    double? budget,
    String? budgetCurrency,
  }) {
    return TripModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      travellerCount: travellerCount ?? this.travellerCount,
      travelType: travelType ?? this.travelType,
      budget: budget ?? this.budget,
      budgetCurrency: budgetCurrency ?? this.budgetCurrency,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  String get durationLabel {
    if (durationDays == 1) return '1 day';
    return '$durationDays days';
  }
}
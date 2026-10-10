import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  final String? id;
  final String userId;
  final String tripId;
  final String category;
  final String description;
  final double amount;
  final String currency;
  final DateTime expenseDate;
  final DateTime createdAt;

  ExpenseModel({
    this.id,
    required this.userId,
    required this.tripId,
    required this.category,
    required this.description,
    required this.amount,
    this.currency = 'INR',
    required this.expenseDate,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'tripId': tripId,
      'category': category,
      'description': description,
      'amount': amount,
      'currency': currency,
      'expenseDate': Timestamp.fromDate(expenseDate),
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory ExpenseModel.fromMap(String id, Map<String, dynamic> map) {
    return ExpenseModel(
      id: id,
      userId: map['userId'] ?? '',
      tripId: map['tripId'] ?? '',
      category: map['category'] ?? 'Other',
      description: map['description'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      currency: map['currency'] ?? 'INR',
      expenseDate: map['expenseDate'] != null
          ? (map['expenseDate'] as Timestamp).toDate()
          : DateTime.now(),
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  static const List<String> categories = [
    'Food',
    'Transport',
    'Accommodation',
    'Shopping',
    'Activities',
    'Health',
    'Communication',
    'Other',
  ];

  static Map<String, String> categoryIcons = {
    'Food': 'ðŸœ',
    'Transport': 'ðŸšƒ',
    'Accommodation': 'ðŸ¨',
    'Shopping': 'ðŸ›ï¸',
    'Activities': 'ðŸŽŒ',
    'Health': 'ðŸ’Š',
    'Communication': 'ðŸ“±',
    'Other': 'ðŸ“Œ',
  };
}
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  const Rating({this.rate, this.count});

  factory Rating.fromJson(String data) {
    return Rating.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory Rating.fromMap(Map<String, dynamic> data) => Rating(
        rate: (data['rate'] as num?)?.toDouble(),
        count: data['count'] as int?,
      );
  final double? rate;
  final int? count;

  Map<String, dynamic> toMap() => <String, dynamic>{
        'rate': rate,
        'count': count,
      };

  String toJson() => json.encode(toMap());

  Rating copyWith({
    double? rate,
    int? count,
  }) {
    return Rating(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [rate, count];
}

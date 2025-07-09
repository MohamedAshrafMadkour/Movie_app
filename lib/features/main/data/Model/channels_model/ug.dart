import 'package:equatable/equatable.dart';

import 'buy.dart';
import 'rent.dart';

class Ug extends Equatable {
  final String? link;
  final List<Buy>? buy;
  final List<Rent>? rent;

  const Ug({this.link, this.buy, this.rent});

  factory Ug.fromJson(Map<String, dynamic> json) => Ug(
    link: json['link'] as String?,
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'buy': buy?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, buy, rent];
}

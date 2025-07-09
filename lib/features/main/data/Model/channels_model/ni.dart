import 'package:equatable/equatable.dart';

import 'buy.dart';
import 'rent.dart';

class Ni extends Equatable {
  final String? link;
  final List<Rent>? rent;
  final List<Buy>? buy;

  const Ni({this.link, this.rent, this.buy});

  factory Ni.fromJson(Map<String, dynamic> json) => Ni(
    link: json['link'] as String?,
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'rent': rent?.map((e) => e.toJson()).toList(),
    'buy': buy?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, rent, buy];
}

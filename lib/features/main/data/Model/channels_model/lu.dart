import 'package:equatable/equatable.dart';

import 'buy.dart';
import 'flatrate.dart';
import 'rent.dart';

class Lu extends Equatable {
  final String? link;
  final List<Buy>? buy;
  final List<Rent>? rent;
  final List<Flatrate>? flatrate;

  const Lu({this.link, this.buy, this.rent, this.flatrate});

  factory Lu.fromJson(Map<String, dynamic> json) => Lu(
    link: json['link'] as String?,
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'buy': buy?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, buy, rent, flatrate];
}

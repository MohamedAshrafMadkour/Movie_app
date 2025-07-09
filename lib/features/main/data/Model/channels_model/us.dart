import 'package:equatable/equatable.dart';

import 'buy.dart';
import 'flatrate.dart';
import 'free.dart';
import 'rent.dart';

class Us extends Equatable {
  final String? link;
  final List<Buy>? buy;
  final List<Flatrate>? flatrate;
  final List<Free>? free;
  final List<Rent>? rent;

  const Us({this.link, this.buy, this.flatrate, this.free, this.rent});

  factory Us.fromJson(Map<String, dynamic> json) => Us(
    link: json['link'] as String?,
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
    free: (json['free'] as List<dynamic>?)
        ?.map((e) => Free.fromJson(e as Map<String, dynamic>))
        .toList(),
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'buy': buy?.map((e) => e.toJson()).toList(),
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
    'free': free?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, buy, flatrate, free, rent];
}

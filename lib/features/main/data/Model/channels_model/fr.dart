import 'package:equatable/equatable.dart';

import 'ad.dart';
import 'buy.dart';
import 'flatrate.dart';
import 'rent.dart';

class Fr extends Equatable {
  final String? link;
  final List<Buy>? buy;
  final List<Ad>? ads;
  final List<Rent>? rent;
  final List<Flatrate>? flatrate;

  const Fr({this.link, this.buy, this.ads, this.rent, this.flatrate});

  factory Fr.fromJson(Map<String, dynamic> json) => Fr(
    link: json['link'] as String?,
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    ads: (json['ads'] as List<dynamic>?)
        ?.map((e) => Ad.fromJson(e as Map<String, dynamic>))
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
    'ads': ads?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, buy, ads, rent, flatrate];
}

import 'package:equatable/equatable.dart';

import 'ad.dart';
import 'buy.dart';
import 'flatrate.dart';
import 'rent.dart';

class De extends Equatable {
  final String? link;
  final List<Ad>? ads;
  final List<Flatrate>? flatrate;
  final List<Buy>? buy;
  final List<Rent>? rent;

  const De({this.link, this.ads, this.flatrate, this.buy, this.rent});

  factory De.fromJson(Map<String, dynamic> json) => De(
    link: json['link'] as String?,
    ads: (json['ads'] as List<dynamic>?)
        ?.map((e) => Ad.fromJson(e as Map<String, dynamic>))
        .toList(),
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'ads': ads?.map((e) => e.toJson()).toList(),
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
    'buy': buy?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, ads, flatrate, buy, rent];
}

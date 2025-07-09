import 'package:equatable/equatable.dart';

import 'ad.dart';
import 'buy.dart';
import 'flatrate.dart';
import 'rent.dart';

class Au extends Equatable {
  final String? link;
  final List<Rent>? rent;
  final List<Buy>? buy;
  final List<Flatrate>? flatrate;
  final List<Ad>? ads;

  const Au({this.link, this.rent, this.buy, this.flatrate, this.ads});

  factory Au.fromJson(Map<String, dynamic> json) => Au(
    link: json['link'] as String?,
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
    ads: (json['ads'] as List<dynamic>?)
        ?.map((e) => Ad.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'rent': rent?.map((e) => e.toJson()).toList(),
    'buy': buy?.map((e) => e.toJson()).toList(),
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
    'ads': ads?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, rent, buy, flatrate, ads];
}

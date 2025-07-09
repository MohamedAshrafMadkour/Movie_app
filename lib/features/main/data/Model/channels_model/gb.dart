import 'package:equatable/equatable.dart';

import 'ad.dart';
import 'buy.dart';
import 'flatrate.dart';
import 'rent.dart';

class Gb extends Equatable {
  final String? link;
  final List<Flatrate>? flatrate;
  final List<Buy>? buy;
  final List<Ad>? ads;
  final List<Rent>? rent;

  const Gb({this.link, this.flatrate, this.buy, this.ads, this.rent});

  factory Gb.fromJson(Map<String, dynamic> json) => Gb(
    link: json['link'] as String?,
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
    buy: (json['buy'] as List<dynamic>?)
        ?.map((e) => Buy.fromJson(e as Map<String, dynamic>))
        .toList(),
    ads: (json['ads'] as List<dynamic>?)
        ?.map((e) => Ad.fromJson(e as Map<String, dynamic>))
        .toList(),
    rent: (json['rent'] as List<dynamic>?)
        ?.map((e) => Rent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
    'buy': buy?.map((e) => e.toJson()).toList(),
    'ads': ads?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, flatrate, buy, ads, rent];
}

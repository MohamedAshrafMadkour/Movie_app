import 'package:equatable/equatable.dart';

import 'buy.dart';
import 'rent.dart';

class Cr extends Equatable {
  final String? link;
  final List<Rent>? rent;
  final List<Buy>? buy;

  const Cr({this.link, this.rent, this.buy});

  factory Cr.fromJson(Map<String, dynamic> json) => Cr(
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

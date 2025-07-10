import 'flatrate.dart';
import 'buy.dart';
import 'rent.dart';

class CountryChannels {
  final String? link;
  final List<Flatrate>? flatrate;
  final List<Buy>? buy;
  final List<Rent>? rent;

  CountryChannels({this.link, this.flatrate, this.buy, this.rent});

  factory CountryChannels.fromJson(Map<String, dynamic> json) {
    return CountryChannels(
      link: json['link'] as String?,
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
  }

  Map<String, dynamic> toJson() => {
    'link': link,
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
    'buy': buy?.map((e) => e.toJson()).toList(),
    'rent': rent?.map((e) => e.toJson()).toList(),
  };
}

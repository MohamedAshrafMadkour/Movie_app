import 'package:equatable/equatable.dart';

import 'flatrate.dart';

class Zw extends Equatable {
  final String? link;
  final List<Flatrate>? flatrate;

  const Zw({this.link, this.flatrate});

  factory Zw.fromJson(Map<String, dynamic> json) => Zw(
    link: json['link'] as String?,
    flatrate: (json['flatrate'] as List<dynamic>?)
        ?.map((e) => Flatrate.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'link': link,
    'flatrate': flatrate?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [link, flatrate];
}

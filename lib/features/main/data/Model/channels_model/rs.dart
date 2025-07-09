import 'package:equatable/equatable.dart';

import 'flatrate.dart';

class Rs extends Equatable {
  final String? link;
  final List<Flatrate>? flatrate;

  const Rs({this.link, this.flatrate});

  factory Rs.fromJson(Map<String, dynamic> json) => Rs(
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

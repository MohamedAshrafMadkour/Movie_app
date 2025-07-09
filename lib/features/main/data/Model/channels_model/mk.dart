import 'package:equatable/equatable.dart';

import 'flatrate.dart';

class Mk extends Equatable {
  final String? link;
  final List<Flatrate>? flatrate;

  const Mk({this.link, this.flatrate});

  factory Mk.fromJson(Map<String, dynamic> json) => Mk(
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

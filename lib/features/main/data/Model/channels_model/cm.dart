import 'package:equatable/equatable.dart';

import 'flatrate.dart';

class Cm extends Equatable {
  final String? link;
  final List<Flatrate>? flatrate;

  const Cm({this.link, this.flatrate});

  factory Cm.fromJson(Map<String, dynamic> json) => Cm(
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

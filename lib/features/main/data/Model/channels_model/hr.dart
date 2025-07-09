import 'package:equatable/equatable.dart';

import 'flatrate.dart';

class Hr extends Equatable {
  final String? link;
  final List<Flatrate>? flatrate;

  const Hr({this.link, this.flatrate});

  factory Hr.fromJson(Map<String, dynamic> json) => Hr(
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

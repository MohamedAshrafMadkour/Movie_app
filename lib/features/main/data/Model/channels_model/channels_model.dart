import 'package:equatable/equatable.dart';

import 'results.dart';

class ChannelsModel extends Equatable {
  final int? id;
  final Results? results;

  const ChannelsModel({this.id, this.results});

  factory ChannelsModel.fromJson(Map<String, dynamic> json) => ChannelsModel(
    id: json['id'] as int?,
    results: json['results'] == null
        ? null
        : Results.fromJson(json['results'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'id': id, 'results': results?.toJson()};

  @override
  List<Object?> get props => [id, results];
}

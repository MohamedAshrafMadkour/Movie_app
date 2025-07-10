import 'package:equatable/equatable.dart';
import 'country_channels.dart';

class ChannelsModel extends Equatable {
  final int? id;
  final Map<String, CountryChannels>? results;

  const ChannelsModel({this.id, this.results});

  factory ChannelsModel.fromJson(Map<String, dynamic> json) {
    return ChannelsModel(
      id: json['id'] as int?,
      results: (json['results'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          CountryChannels.fromJson(value as Map<String, dynamic>),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'results': results?.map((key, value) => MapEntry(key, value.toJson())),
  };

  @override
  List<Object?> get props => [id, results];
}

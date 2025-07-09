import 'package:equatable/equatable.dart';

class Rent extends Equatable {
  final String? logoPath;
  final int? providerId;
  final String? providerName;
  final int? displayPriority;

  const Rent({
    this.logoPath,
    this.providerId,
    this.providerName,
    this.displayPriority,
  });

  factory Rent.fromJson(Map<String, dynamic> json) => Rent(
    logoPath: json['logo_path'] as String?,
    providerId: json['provider_id'] as int?,
    providerName: json['provider_name'] as String?,
    displayPriority: json['display_priority'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'logo_path': logoPath,
    'provider_id': providerId,
    'provider_name': providerName,
    'display_priority': displayPriority,
  };

  @override
  List<Object?> get props {
    return [logoPath, providerId, providerName, displayPriority];
  }
}

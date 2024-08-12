import 'package:equatable/equatable.dart';

class CityEntites extends Equatable {
  final String name;
  final String id;
  final String? shortName;
  const CityEntites({
    required this.name,
    required this.id,
    this.shortName,
  });

  @override
  List<Object?> get props => [name, id];
}

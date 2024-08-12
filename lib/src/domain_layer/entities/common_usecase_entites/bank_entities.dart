import 'package:equatable/equatable.dart';

class BankEntites extends Equatable {
  final String name;
  final String id;

  const BankEntites({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];
}

// Event
import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends RegistrationEvent {
  final String name;
  final String family;
  final String password;

  const RegisterButtonPressed({
    required this.name,
    required this.family,
    required this.password,
  });

  @override
  List<Object> get props => [name, family, password];
}
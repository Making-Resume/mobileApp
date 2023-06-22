
// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage._state.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield* _mapRegisterButtonPressedToState(event);
    }
  }

  Stream<RegistrationState> _mapRegisterButtonPressedToState(
    RegisterButtonPressed event,
  ) async* {
    try {
      // Perform registration logic here
      // Replace with your own implementation
      await Future.delayed(Duration(seconds: 2));

      // Simulating registration success/failure
      final bool registrationSuccess = event.name.isNotEmpty &&
          event.family.isNotEmpty &&
          event.password.isNotEmpty;

      if (registrationSuccess) {
        yield RegistrationSuccess();
      } else {
        yield RegistrationFailure();
      }
    } catch (e) {
      yield RegistrationFailure();
    }
  }
}
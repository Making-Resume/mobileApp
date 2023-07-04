
// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage._state.dart';
import 'package:resumemaker/bloc/registrationPage/registrationPage_event.dart';

import '../../models/ApiError.dart';
import '../../models/UserAuthentication.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
  }

  void _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegistrationState> emit,
  ) async {
    try {
      emit(RegistrationLoading(height: 50, width: 50));
// await Future<void>.delayed(const Duration(seconds: 1));
      // Perform registration logic here
      // Replace with your own implementation
      UserAuthenticationRepository user = UserAuthenticationRepository();
      var value = await user.mainRegistration(
        name: event.name,
        family: event.family,
        password: event.password,
      )!.timeout(Duration(seconds: 7));

      if (value is User) {
      if(value.code !=  200){
        emit(RegistrationFailure(height: 50, width: 200, error: value.message));
      }else{
        emit(RegistrationSuccess(height: 50, width: 200, users: value.data));
      }
        
        // Navigator.pushNamed(context, '/codeVerification');
      } else if (value is ApiError) {
        emit(RegistrationFailure(height: 50, width: 200, error: value.message));
        // showDialog(...)
      }
    } catch (e) {
      emit(RegistrationFailure(height: 50, width: 200, error: e.toString()));
    }
  }

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield* _mapRegisterButtonPressedToState(event);
    }
  }

  Stream<RegistrationState> _mapRegisterButtonPressedToState(
    RegisterButtonPressed event,
  ) async* {
    // Your implementation here
  }
}

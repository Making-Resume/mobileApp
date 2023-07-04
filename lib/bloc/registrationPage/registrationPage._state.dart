
// State
import 'package:equatable/equatable.dart';
import 'package:resumemaker/models/UserAuthentication.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {

   
   RegistrationInitial();

}

class RegistrationLoading extends RegistrationState {
     double? width;
   double? height;
   
  RegistrationLoading({this.width , this.height});
}


class RegistrationSuccess extends RegistrationState {
  var users;
     double? width;
   double? height;
 RegistrationSuccess({this.users , this.width , this.height });
  // @override
  // List<Object?> get props => [users];

}

class RegistrationFailure extends RegistrationState {
     double? width;
   double? height;
  String? error;
  RegistrationFailure({this.error , this.height , this.width });
  
  //   @override
  // List<Object?> get props => [error];
}
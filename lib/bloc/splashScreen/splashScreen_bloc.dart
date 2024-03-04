import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resumemaker/bloc/splashScreen/splashScreen_event.dart';
import 'package:resumemaker/bloc/splashScreen/splashScreen_state.dart';



class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      // Wait for 4 seconds
      await Future.delayed(const Duration(seconds: 4));
      emit(SplashComplete());
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_in_use_case.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(Empty()) {
    on<SignIn>(_signInHandler);
  }

  void _signInHandler(SignIn event, Emitter<SignInState> emit) async {
    try {
      emit(Loading());
      final response = await _signInUseCase.execute(event.signInRequest);
      emit(Loaded(jwtTokenEntity: response));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}

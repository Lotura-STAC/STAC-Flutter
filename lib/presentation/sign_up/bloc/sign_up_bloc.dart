import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_up_use_case.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_event.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(this._signUpUseCase) : super(Empty()) {
    on<SignUp>(_signUpHandler);
  }

  void _signUpHandler(SignUp event, Emitter<SignUpState> emit) async {
    try {
      emit(Loading());
      final response = await _signUpUseCase.execute(event.signUpRequest);
      emit(Loaded(isSuccess: response));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}

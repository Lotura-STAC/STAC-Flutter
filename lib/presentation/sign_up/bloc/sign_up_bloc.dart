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
      if (event.signUpRequest.adminId.isEmpty) {
        emit(Error(message: "관리자 계정 아이디를 1글자 이상 입력해주세요"));
      } else if (event.signUpRequest.adminPw.isEmpty) {
        emit(Error(message: "관리자 계정 비밀번호를 1글자 이상 입력해주세요"));
      } else if (event.pwdCheck != event.signUpRequest.adminPw) {
        emit(Error(message: "비밀번호를 한번 더 확인해주세요"));
      } else {
        final response = await _signUpUseCase.execute(event.signUpRequest);
        emit(Loaded(isSuccess: response));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}

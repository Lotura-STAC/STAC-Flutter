import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/data/auth/dto/response/sign_in_response.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_admin_request.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_in_use_case.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:stac_flutter/domain/notify/use_case/notify_admin_use_case.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;
  final NotifyAdminUseCase _notifyAdminUseCase;

  SignInBloc(this._signInUseCase, this._notifyAdminUseCase) : super(Empty()) {
    on<SignIn>(_signInHandler);
    on<ResetEvent>(_resetEventHandler);
  }

  void _signInHandler(SignIn event, Emitter<SignInState> emit) async {
    try {
      emit(Loading());
      final response = await _signInUseCase.execute(event.signInRequest);
      if (response.role == Role.admin) {
        String? token = await FirebaseMessaging.instance.getToken();
        await _notifyAdminUseCase
            .execute(NotifyAdminRequest(deviceToken: token.toString()));
      }
      emit(Loaded(jwtTokenEntity: response));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _resetEventHandler(ResetEvent event, Emitter<SignInState> emit) =>
      emit(Empty());
}

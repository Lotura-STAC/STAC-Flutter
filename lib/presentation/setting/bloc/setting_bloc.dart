import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_out_use_case.dart';
import 'package:stac_flutter/presentation/setting/bloc/setting_event.dart';
import 'package:stac_flutter/presentation/setting/bloc/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final SignOutUseCase _signOutUseCase;

  SettingBloc(this._signOutUseCase) : super(Empty()) {
    on<SignOutEvent>(_signOutEventHandler);
    on<GuestSignOutEvent>(_guestSignOutEventHandler);
  }

  void _signOutEventHandler(
      SignOutEvent event, Emitter<SettingState> emit) async {
    try {
      emit(Loading());
      final response = await _signOutUseCase.execute();
      if (response == false) {
        emit(Error(message: "로그아웃에 실패하였습니다"));
      }
      emit(Loaded());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _guestSignOutEventHandler(
      GuestSignOutEvent event, Emitter<SettingState> emit) {
    emit(Loaded());
  }
}

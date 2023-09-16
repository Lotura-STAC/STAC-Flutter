import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/domain/socket/use_case/get_user_device_list_use_case.dart';
import 'package:stac_flutter/presentation/main/bloc/main_event.dart';
import 'package:stac_flutter/presentation/main/bloc/main_state.dart';
import 'package:stac_flutter/domain/remove_device/use_case/remove_device_use_case.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetUserDeviceListUseCase _getUserDeviceListUseCase;
  final RemoveDeviceUseCase _removeDeviceUseCase;

  MainBloc(this._getUserDeviceListUseCase, this._removeDeviceUseCase)
      : super(Empty()) {
    on<GetUserDeviceListEvent>(_getUserDeviceListEventHandler);
    on<RemoveDeviceEvent>(_removeDeviceEventHandler);
  }

  void _getUserDeviceListEventHandler(
      GetUserDeviceListEvent event, Emitter<MainState> emit) async {
    try {
      emit(Loading());
      _getUserDeviceListUseCase.execute(event.getUserDeviceListRequest);
      await for (var a in _getUserDeviceListUseCase.userDeviceList) {
        emit(Loaded(list: a));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _removeDeviceEventHandler(
      RemoveDeviceEvent event, Emitter<MainState> emit) async {
    try {
      emit(Loading());
      await _removeDeviceUseCase.execute(event.removeDeviceRequest);
      _getUserDeviceListUseCase
          .execute(GetUserDeviceListRequest(accessToken: ""));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}

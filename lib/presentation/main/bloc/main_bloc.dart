import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/domain/socket/use_case/get_user_device_list_use_case.dart';
import 'package:stac_flutter/presentation/main/bloc/main_event.dart';
import 'package:stac_flutter/presentation/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetUserDeviceListUseCase _getUserDeviceListUseCase;

  MainBloc(this._getUserDeviceListUseCase) : super(Empty()) {
    on<GetUserDeviceListEvent>(_getUserDeviceListEventHandler);
    on<ModifyDeviceNameEvent>(_modifyDeviceEventHandler);
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

  void _modifyDeviceEventHandler(
      ModifyDeviceNameEvent event, Emitter<MainState> emit) {}
}

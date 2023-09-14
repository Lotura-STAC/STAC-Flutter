import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/domain/modify_device/use_case/modify_device_use_case.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_event.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_state.dart';

class ModifyDeviceBloc extends Bloc<ModifyDeviceEvent, ModifyDeviceState> {
  final ModifyDeviceUseCase _modifyDeviceUseCase;

  ModifyDeviceBloc(this._modifyDeviceUseCase) : super(Empty()) {
    on<ModifyDevice>(_modifyDeviceHandler);
  }

  void _modifyDeviceHandler(
      ModifyDevice event, Emitter<ModifyDeviceState> emit) async {
    try {
      emit(Loading());
      await _modifyDeviceUseCase.execute(event.modifyDeviceRequest);
      emit(Loaded());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}

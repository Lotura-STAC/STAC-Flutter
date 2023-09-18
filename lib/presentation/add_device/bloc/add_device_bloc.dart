import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/domain/add_device/use_case/add_device_use_case.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_event.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_state.dart';

class AddDeviceBloc extends Bloc<AddDeviceEvent, AddDeviceState> {
  final AddDeviceUseCase _addDeviceUseCase;

  AddDeviceBloc(this._addDeviceUseCase) : super(Empty()) {
    on<AddDevice>(_addDeviceHandler);
  }

  void _addDeviceHandler(AddDevice event, Emitter<AddDeviceState> emit) async {
    try {
      emit(Loading());
      if (event.addDeviceRequest.name.isEmpty) {
        emit(Error(message: "장치 이름을 한 글자 이상 적어주세요"));
      } else {
        await _addDeviceUseCase.execute(event.addDeviceRequest);
        emit(Loaded());
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}

import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class GetUserDeviceListUseCase {
  final SocketRepository _repository;

  GetUserDeviceListUseCase({required SocketRepository repository})
      : _repository = repository;

  Stream<GetUserDeviceListResponse> execute(
      GetUserDeviceListRequest getUserDeviceListRequest) {
    _repository.getUserDeviceList(getUserDeviceListRequest);
    return _repository.userDeviceListStream;
  }
}

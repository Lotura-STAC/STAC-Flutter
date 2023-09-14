import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';
import 'package:stac_flutter/domain/notify/repository/notify_repository.dart';

class NotifyUseCase {
  final NotifyRepository _notifyRepository;

  NotifyUseCase({required NotifyRepository notifyRepository})
      : _notifyRepository = notifyRepository;

  Future<bool> execute(NotifyRequest notifyRequest) async {
    return await _notifyRepository.notify(notifyRequest);
  }
}

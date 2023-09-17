import 'package:stac_flutter/data/notify/dto/request/notify_admin_request.dart';
import 'package:stac_flutter/domain/notify/repository/notify_repository.dart';

class NotifyAdminUseCase {
  final NotifyRepository _notifyRepository;

  NotifyAdminUseCase({required NotifyRepository notifyRepository})
      : _notifyRepository = notifyRepository;

  Future<bool> execute(NotifyAdminRequest notifyAdminRequest) async {
    return await _notifyRepository.notifyAdmin(notifyAdminRequest);
  }
}

import 'package:stac_flutter/data/notify/dto/request/notify_admin_request.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';

abstract class NotifyRepository {
  Future<bool> notify(NotifyRequest notifyRequest);

  Future<bool> notifyAdmin(NotifyAdminRequest notifyAdminRequest);
}

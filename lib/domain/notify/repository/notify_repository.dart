import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';

abstract class NotifyRepository {
  Future<bool> notify(NotifyRequest notifyRequest);
}

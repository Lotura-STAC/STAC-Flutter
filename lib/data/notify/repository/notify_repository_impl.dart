import 'package:stac_flutter/data/notify/data_source/remote_notify_data_source.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_admin_request.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';
import 'package:stac_flutter/domain/notify/repository/notify_repository.dart';

class NotifyRepositoryImpl extends NotifyRepository {
  final RemoteNotifyDataSource _remoteNotifyDataSource;

  NotifyRepositoryImpl({required RemoteNotifyDataSource remoteNotifyDataSource})
      : _remoteNotifyDataSource = remoteNotifyDataSource;

  @override
  Future<bool> notify(NotifyRequest notifyRequest) async {
    return await _remoteNotifyDataSource.notify(notifyRequest);
  }

  @override
  Future<bool> notifyAdmin(NotifyAdminRequest notifyAdminRequest) async {
    return await _remoteNotifyDataSource.notifyAdmin(notifyAdminRequest);
  }
}

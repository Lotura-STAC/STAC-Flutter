import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/data/add_device/data_source/remote_add_device_data_source.dart';
import 'package:stac_flutter/data/add_device/repository/add_device_repository_impl.dart';
import 'package:stac_flutter/data/auth/data_source/remote_auth_data_source.dart';
import 'package:stac_flutter/data/auth/repository/auth_repository_impl.dart';
import 'package:stac_flutter/data/modify_device/data_source/remote_modify_device_data_source.dart';
import 'package:stac_flutter/data/modify_device/repository/modify_device_repository_impl.dart';
import 'package:stac_flutter/data/notify/data_source/remote_notify_data_source.dart';
import 'package:stac_flutter/data/notify/repository/notify_repository_impl.dart';
import 'package:stac_flutter/data/remove_device/data_source/remote_remove_device_data_source.dart';
import 'package:stac_flutter/data/remove_device/repository/remove_device_repository_impl.dart';
import 'package:stac_flutter/data/socket/data_source/remote_socket_data_source.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';
import 'package:stac_flutter/data/socket/repository/socket_repository_impl.dart';
import 'package:stac_flutter/domain/add_device/repository/add_device_repository.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_out_use_case.dart';
import 'package:stac_flutter/domain/modify_device/repository/modify_device_repository.dart';
import 'package:stac_flutter/domain/modify_device/use_case/modify_device_use_case.dart';
import 'package:stac_flutter/domain/notify/repository/notify_repository.dart';
import 'package:stac_flutter/domain/notify/use_case/notify_admin_use_case.dart';
import 'package:stac_flutter/domain/notify/use_case/notify_use_case.dart';
import 'package:stac_flutter/domain/remove_device/repository/remove_device_repository.dart';
import 'package:stac_flutter/domain/remove_device/use_case/remove_device_use_case.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';
import 'package:stac_flutter/domain/add_device/use_case/add_device_use_case.dart';
import 'package:stac_flutter/domain/socket/use_case/get_user_device_list_use_case.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_in_use_case.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_up_use_case.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_bloc.dart';
import 'package:stac_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_bloc.dart';
import 'package:stac_flutter/presentation/setting/bloc/setting_bloc.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_bloc.dart';

Future<List<BlocProvider>> di() async {
  RemoteAuthDataSource remoteAuthDataSource = RemoteAuthDataSource();
  RemoteSocketDataSource remoteSocketDataSource = RemoteSocketDataSource(
      streamController: StreamController<GetUserDeviceListResponse>());
  RemoteAddDeviceDataSource remoteAddDeviceDataSource =
      RemoteAddDeviceDataSource();
  RemoteRemoveDeviceDataSource remoteRemoveDeviceDataSource =
      RemoteRemoveDeviceDataSource();
  RemoteModifyDeviceDataSource remoteModifyDeviceDataSource =
      RemoteModifyDeviceDataSource();
  RemoteNotifyDataSource remoteNotifyDataSource = RemoteNotifyDataSource();

  AuthRepository authRepository =
      AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDataSource);
  RemoveDeviceRepository removeDeviceRepository = RemoveDeviceRepositoryImpl(
      remoteRemoveDeviceDataSource: remoteRemoveDeviceDataSource);
  SocketRepository socketRepository =
      SocketRepositoryImpl(remoteSocketDataSource: remoteSocketDataSource);
  AddDeviceRepository addDeviceRepository = AddDeviceRepositoryImpl(
      remoteAddDeviceDataSource: remoteAddDeviceDataSource);
  ModifyDeviceRepository modifyDeviceRepository = ModifyDeviceRepositoryImpl(
      remoteModifyDeviceDataSource: remoteModifyDeviceDataSource);
  NotifyRepository notifyRepository =
      NotifyRepositoryImpl(remoteNotifyDataSource: remoteNotifyDataSource);

  AddDeviceUseCase addDeviceUseCase = AddDeviceUseCase(
      addDeviceRepository: addDeviceRepository,
      socketRepository: socketRepository);
  GetUserDeviceListUseCase getUserDeviceListUseCase =
      GetUserDeviceListUseCase(repository: socketRepository);
  SignInUseCase signInUseCase = SignInUseCase(repository: authRepository);
  SignUpUseCase signUpUseCase = SignUpUseCase(repository: authRepository);
  RemoveDeviceUseCase removeDeviceUseCase =
      RemoveDeviceUseCase(removeDeviceRepository: removeDeviceRepository);
  ModifyDeviceUseCase modifyDeviceUseCase = ModifyDeviceUseCase(
      modifyDeviceRepository: modifyDeviceRepository,
      socketRepository: socketRepository);
  NotifyUseCase notifyUseCase =
      NotifyUseCase(notifyRepository: notifyRepository);
  NotifyAdminUseCase notifyAdminUseCase =
      NotifyAdminUseCase(notifyRepository: notifyRepository);
  SignOutUseCase signOutUseCase =
      SignOutUseCase(authRepository: authRepository);

  return [
    BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(signInUseCase, notifyAdminUseCase)),
    BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(signUpUseCase)),
    BlocProvider<AddDeviceBloc>(
        create: (context) => AddDeviceBloc(addDeviceUseCase)),
    BlocProvider<MainBloc>(
        create: (context) => MainBloc(
            getUserDeviceListUseCase, removeDeviceUseCase, notifyUseCase)),
    BlocProvider<ModifyDeviceBloc>(
        create: (context) => ModifyDeviceBloc(modifyDeviceUseCase)),
    BlocProvider<SettingBloc>(create: (context) => SettingBloc(signOutUseCase)),
  ];
}

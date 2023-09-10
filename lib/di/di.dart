import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/data/auth/data_source/local_auth_data_source.dart';
import 'package:stac_flutter/data/auth/data_source/remote_auth_data_source.dart';
import 'package:stac_flutter/data/auth/repository/auth_repository_impl.dart';
import 'package:stac_flutter/data/socket/data_source/local_socket_data_source.dart';
import 'package:stac_flutter/data/socket/data_source/remote_socket_data_source.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';
import 'package:stac_flutter/data/socket/repository/socket_repository_impl.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';
import 'package:stac_flutter/domain/socket/entity/user_device_list_entity.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';
import 'package:stac_flutter/domain/socket/use_case/add_device_use_case.dart';
import 'package:stac_flutter/domain/socket/use_case/get_user_device_list_use_case.dart';
import 'package:stac_flutter/domain/socket/use_case/remove_device_use_case.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_in_use_case.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_up_use_case.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_bloc.dart';
import 'package:stac_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_bloc.dart';

Future<List<BlocProvider>> di() async {
  RemoteAuthDataSource remoteAuthDataSource = RemoteAuthDataSource();
  RemoteSocketDataSource remoteSocketDataSource = RemoteSocketDataSource(
      streamController: StreamController<GetUserDeviceListResponse>());

  LocalAuthDateSource localAuthDateSource = LocalAuthDateSource();
  LocalSocketDataSource localSocketDataSource = LocalSocketDataSource();

  AuthRepository authRepository = AuthRepositoryImpl(
      remoteAuthDataSource: remoteAuthDataSource,
      localAuthDateSource: localAuthDateSource);
  SocketRepository socketRepository = SocketRepositoryImpl(
      remoteSocketDataSource: remoteSocketDataSource,
      localSocketDataSource: localSocketDataSource);

  AddDeviceUseCase addDeviceUseCase =
      AddDeviceUseCase(repository: socketRepository);
  GetUserDeviceListUseCase getUserDeviceListUseCase =
      GetUserDeviceListUseCase(repository: socketRepository);
  RemoveDeviceUseCase removeDeviceUseCase =
      RemoveDeviceUseCase(repository: socketRepository);
  SignInUseCase signInUseCase = SignInUseCase(repository: authRepository);
  SignUpUseCase signUpUseCase = SignUpUseCase(repository: authRepository);

  return [
    BlocProvider<SignInBloc>(create: (context) => SignInBloc(signInUseCase)),
    BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(signUpUseCase)),
    BlocProvider<AddDeviceBloc>(
        create: (context) => AddDeviceBloc(addDeviceUseCase)),
    BlocProvider<MainBloc>(
        create: (context) =>
            MainBloc(removeDeviceUseCase, getUserDeviceListUseCase)),
  ];
}

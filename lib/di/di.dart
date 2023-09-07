import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stac_flutter/data/data_source/auth/local_auth_data_source.dart';
import 'package:stac_flutter/data/data_source/auth/remote_auth_data_source.dart';
import 'package:stac_flutter/data/repository/auth/auth_repository_impl.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_in_use_case.dart';
import 'package:stac_flutter/domain/auth/use_case/sign_up_use_case.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_bloc.dart';

Future<List<BlocProvider>> di() async {
  RemoteAuthDataSource remoteAuthDataSource = RemoteAuthDataSource();
  LocalAuthDateSource localAuthDateSource = LocalAuthDateSource();
  AuthRepository authRepository = AuthRepositoryImpl(
      remoteAuthDataSource: remoteAuthDataSource,
      localAuthDateSource: localAuthDateSource);
  SignInUseCase signInUseCase = SignInUseCase(repository: authRepository);
  SignUpUseCase signUpUseCase = SignUpUseCase(repository: authRepository);
  return [
    BlocProvider<SignInBloc>(create: (context) => SignInBloc(signInUseCase)),
    BlocProvider<SignUpBloc>(create: (context) => SignUpBloc(signUpUseCase)),
  ];
}

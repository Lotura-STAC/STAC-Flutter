import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase({required AuthRepository authRepository})
      : _repository = authRepository;

  Future<bool> execute() async {
    return await _repository.signOut();
  }
}

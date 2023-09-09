import 'package:stac_flutter/data/auth/dto/request/sign_up_request.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  Future<bool> execute(SignUpRequest signUpRequest) async {
    final response = await repository.signUp(signUpRequest);
    return response;
  }
}

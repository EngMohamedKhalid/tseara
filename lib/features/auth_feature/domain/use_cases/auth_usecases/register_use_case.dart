import 'package:dartz/dartz.dart';

import '../../../../../app/error/failures.dart';
import '../../../../../app/usecase/usecase.dart';
import '../../../data/models/user_model.dart';
import '../../repo/auth_repo.dart';

class RegisterUseCase implements UseCase<String, RegisterUSeCaseParams> {
  final AuthRepo repository;

  RegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(RegisterUSeCaseParams params) async{
    return await repository.register(params.toMap());
  }

}

class RegisterUSeCaseParams {
  final String email;
  final String password;
  final String name;
  final String password_confirmation;
  final String address;

  RegisterUSeCaseParams(
      {
        required this.email,
        required this.password,
        required this.password_confirmation,
        required this.name,
        required this.address,

      });

  Map<String, String> toMap() {
    final map = {
      "email": email,
      "password": password,
      "confirmed_password": password_confirmation,
      "address": address,
      "username": name
    };
    return map;
  }
}

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/failures/failures.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/repository/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failures,RegisterResponseEntity>>invoke(
      String name,
      String email,
      String password,
      String rePassword,
      String phone,){
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
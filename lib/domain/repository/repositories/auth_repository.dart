import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';
import '../../../Core/failures/failures.dart';
import '../../entities/LoginResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password);
}

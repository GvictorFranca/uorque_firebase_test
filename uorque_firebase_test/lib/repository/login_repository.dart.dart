import 'package:dartz/dartz.dart';
import 'package:uorque_firebase_test/failure/login_failure.dart';
import 'package:uorque_firebase_test/model/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserModel>> login(String email, String password);
}

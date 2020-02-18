import 'package:dartz/dartz.dart';

import 'package:uorque_firebase_test/failure/login_failure.dart';

import 'package:uorque_firebase_test/model/user_model.dart';
import 'package:uorque_firebase_test/repository/login_remote_data_source.dart';

import 'login_repository.dart.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource)
      : assert(_loginRemoteDataSource != null);

  @override
  Future<Either<Failure, UserModel>> login(
      String email, String password) async {
    return await _loginRemoteDataSource.login(email, password);
  }
}

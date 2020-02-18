import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uorque_firebase_test/failure/login_failure.dart';
import 'package:uorque_firebase_test/model/user_model.dart';
import 'package:uorque_firebase_test/repository/login_remote_data_source.dart';
import 'package:uorque_firebase_test/repository/mapper.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {

  final Mapper mapper;

  LoginRemoteDataSourceImpl(this.mapper): assert(mapper != null);

  @override
  Future<Either<Failure, UserModel>> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
          return Left(LoginFailure());
        }).then((auth) {
          if(auth.user != null){
            return Right(mapper.firebaseUserToModel(auth.user));
          } else {
            return Left(LoginFailure());
          } 
        });
    
  }
}


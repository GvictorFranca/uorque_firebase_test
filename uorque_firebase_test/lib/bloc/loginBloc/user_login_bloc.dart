import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uorque_firebase_test/bloc/loginBloc/user_login_event.dart';
import 'package:uorque_firebase_test/bloc/loginBloc/user_login_state.dart';
import 'dart:developer' as developer;


import 'package:uorque_firebase_test/repositories/auth_repo..dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  AuthRepo authRepo;

  UserLoginBloc({@required AuthRepo authRepo}) {
    this.authRepo = authRepo;
  }

  @override
  UserLoginState get initialState => LoginInitialState();

  @override
  Stream<UserLoginState> mapEventToState(UserLoginEvent event) async* {
    if (event is UserLoginButtonPressedEvent) {
      yield LoginLoadingState();
      try {
        
        var user = await authRepo.signInEmailAndPassword(event.email, event.password);
        yield LoginSuccesseState(user);
      } catch (e) {
        yield LoginFailureState(e.toString());
      }
    }
  }
}

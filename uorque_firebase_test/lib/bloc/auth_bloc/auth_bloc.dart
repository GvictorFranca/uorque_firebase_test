import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uorque_firebase_test/bloc/auth_bloc/auth_event.dart';
import 'package:uorque_firebase_test/bloc/auth_bloc/auth_state.dart';
import 'package:uorque_firebase_test/repositories/auth_repo..dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo;

  AuthBloc({@required AuthRepo authRepo}) {
    this.authRepo = authRepo;
  }
  @override
  
  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await authRepo.isSignedIn();
        if (isSignedIn) {
          var user = await authRepo.getCurrentUser();
          yield AuthenticatedState(user);
        } else {
          yield UnAuthenticatedState();
        }
      } catch (e) {
        yield UnAuthenticatedState();
      }
    }
  }
}

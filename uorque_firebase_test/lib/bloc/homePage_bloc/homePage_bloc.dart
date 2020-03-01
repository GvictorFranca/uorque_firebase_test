import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_event.dart';
import 'package:uorque_firebase_test/bloc/homePage_bloc/homePage_state.dart';
import 'package:uorque_firebase_test/repositories/auth_repo..dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  AuthRepo authRepo;

  HomePageBloc({@required AuthRepo authRepo}) {
    this.authRepo = AuthRepo();
  }

  @override
  // TODO: implement initialState
  HomePageState get initialState => LogOutInitialState();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LogOutEvent) {
      await authRepo.signOut();
      yield LogOutSuccessState();
    }
  }
}

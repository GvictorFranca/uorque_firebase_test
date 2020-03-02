  import 'package:equatable/equatable.dart';


abstract class HomePageState extends Equatable{}

class HomePageLoadedState extends HomePageState {
    
  String userEmail;

  HomePageLoadedState(this.userEmail);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class HomePageInitialState extends HomePageState {
  @override
  List<Object> get props => null;
}

class LogOutSuccessState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}


import 'package:equatable/equatable.dart';


abstract class UserLoginEvent extends Equatable {}

class UserLoginButtonPressedEvent extends UserLoginEvent {
  
  String email, password;

  UserLoginButtonPressedEvent({this.email, this.password});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

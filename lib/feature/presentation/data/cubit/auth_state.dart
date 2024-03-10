class AuthStates{}

class AuthInitStates extends AuthStates{

}
class LoginLoadingState extends AuthStates{}
class LoginSuccesState extends AuthStates{}
class LoginErrorState extends AuthStates{
  final String error;

  LoginErrorState({required this.error});
}


class SignUpLoadingState extends AuthStates{}
class SignUpSuccesState extends AuthStates{}
class SignUpErrorState extends AuthStates{
  final String error;

  SignUpErrorState({required this.error});
}
abstract class AuthState{}

class AuthInitialState extends AuthState{}

class AuthRegisterLoading extends AuthState{}
class AuthRegisterSuccess extends AuthState{}
class AuthRegisterError extends AuthState
{
  String error;
  AuthRegisterError({required this.error});
}

class AuthLoginLoading extends AuthState{}
class AuthLoginSuccess extends AuthState{}
class AuthLoginError extends AuthState
{
  String error;
  AuthLoginError({required this.error});
}
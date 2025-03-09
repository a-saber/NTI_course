abstract class AuthState{}

class AuthInitialState extends AuthState{}
class AuthRegisterLoading extends AuthState{}
class AuthRegisterSuccess extends AuthState{}
class AuthRegisterError extends AuthState
{
  String error;
  AuthRegisterError({required this.error});
}
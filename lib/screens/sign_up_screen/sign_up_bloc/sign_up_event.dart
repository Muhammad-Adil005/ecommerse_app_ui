abstract class SignUpEvent {}

class CallEmailVisibility extends SignUpEvent {}

class CallPasswordVisibility extends SignUpEvent {}

class CallConfirmPasswordVisibility extends SignUpEvent {}

class CallSignUpEvent extends SignUpEvent {
  final String email;
  final String password;
  final String confirmPassword;

  CallSignUpEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

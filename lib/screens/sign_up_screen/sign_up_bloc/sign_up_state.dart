import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final bool loading;
  final bool emailVisibility;
  final bool passwordVisibility;
  final bool confirmPasswordVisibility;

  const SignUpState({
    this.loading = false,
    this.emailVisibility = true,
    this.passwordVisibility = true,
    this.confirmPasswordVisibility = true,
  });

  SignUpState copyWith({
    bool? loading,
    bool? emailVisibility,
    bool? passwordVisibility,
    bool? confirmPasswordVisibility,
  }) {
    return SignUpState(
      loading: loading ?? this.loading,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      confirmPasswordVisibility:
          confirmPasswordVisibility ?? this.confirmPasswordVisibility,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        emailVisibility,
        passwordVisibility,
        confirmPasswordVisibility,
      ];
}

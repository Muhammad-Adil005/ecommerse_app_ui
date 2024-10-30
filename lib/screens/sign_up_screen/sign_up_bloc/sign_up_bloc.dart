import '../../../exports.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    registerEvent();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void registerEvent() {
    on<CallEmailVisibility>(_onCallEmailVisibility);
    on<CallPasswordVisibility>(_onCallPasswordVisibility);
    on<CallConfirmPasswordVisibility>(_onCallConfirmPasswordVisibility);
    on<CallSignUpEvent>(_onCallSignUpEvent);
  }

  void _onCallEmailVisibility(
      CallEmailVisibility event, Emitter<SignUpState> emit) {
    emit(state.copyWith(emailVisibility: !state.emailVisibility));
  }

  void _onCallPasswordVisibility(
      CallPasswordVisibility event, Emitter<SignUpState> emit) {
    emit(state.copyWith(passwordVisibility: !state.passwordVisibility));
  }

  void _onCallConfirmPasswordVisibility(
      CallConfirmPasswordVisibility event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
        confirmPasswordVisibility: !state.confirmPasswordVisibility));
  }

  FutureOr<void> _onCallSignUpEvent(
      CallSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(loading: true));

    try {
      // var response = await
    } catch (e) {}
  }
}

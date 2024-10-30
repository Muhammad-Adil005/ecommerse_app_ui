import 'package:e_commerse_app/screens/otp_verificarion_screen/otp_varification.dart';

import '../screens/screens.dart';
import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.customScreen:
        return MaterialPageRoute(
          builder: (_) => const CustomScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );

      case Routes.otpVerificationScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpVerificationScreen(),
        );

      case Routes.newPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordScreen(),
        );
      case Routes.customScreen1:
        return MaterialPageRoute(
          builder: (_) => const CustomScreen1(),
        );
      case Routes.customScreen2:
        return MaterialPageRoute(
          builder: (_) => const CustomScreen2(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

import '../../exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3500));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasSeenOnboarding = prefs.getBool('hasSeenOnboarding');

    if (mounted) {
      if (hasSeenOnboarding == null || !hasSeenOnboarding) {
        Navigator.pushReplacementNamed(context, Routes.initial);
        await prefs.setBool('hasSeenOnboarding', true);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          8.h,
          Image.asset('Splash'.pngImage),
          CustomElevatedButton(
            text: 'Let’s Get Started',
            onTap: () {
              Navigator.pushNamed(context, Routes.customScreen);
            },
          ).padOnly(bottom: 16),
        ],
      ),
    );
  }
}

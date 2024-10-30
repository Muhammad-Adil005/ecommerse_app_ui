import '../../exports.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SignUpBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              final signUpBloc = context.read<SignUpBloc>();
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Splash'.pngImage, height: 200),
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          16.h,
                          const Text(
                            'Enter your details below',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          16.h,
                          CustomTextField(
                            controller: signUpBloc.emailController,
                            hintText: 'Email Address',
                            prefixIcon: IconButton(
                              icon: Icon(
                                state.emailVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xff636363),
                              ),
                              onPressed: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(CallEmailVisibility());
                              },
                            ),
                            obscureText: state.emailVisibility,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                            borderColor: const Color(0xff636363),
                          ),
                          16.h,
                          CustomTextField(
                            controller: signUpBloc.passwordController,
                            hintText: 'Password',
                            prefixIcon: IconButton(
                              icon: Icon(
                                state.passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xff636363),
                              ),
                              onPressed: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(CallPasswordVisibility());
                              },
                            ),
                            obscureText: state.passwordVisibility,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            borderColor: const Color(0xff636363),
                          ),
                          16.h,
                          CustomTextField(
                            controller: signUpBloc.confirmPasswordController,
                            hintText: 'Confirm Password',
                            prefixIcon: IconButton(
                              icon: Icon(
                                state.confirmPasswordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xff636363),
                              ),
                              onPressed: () {
                                context
                                    .read<SignUpBloc>()
                                    .add(CallConfirmPasswordVisibility());
                              },
                            ),
                            obscureText: state.confirmPasswordVisibility,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your confirm password';
                              }
                              return null;
                            },
                            borderColor: const Color(0xff636363),
                          ),
                          16.h,
                          CustomElevatedButton(
                            text: 'Sign Up',
                            onTap: () {},
                          ),
                          16.h,
                          const Row(
                            children: [
                              Expanded(
                                child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10),
                              ),
                              Text('Or continue with',
                                  style: TextStyle(color: Colors.white)),
                              Expanded(
                                child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10),
                              ),
                            ],
                          ),
                          16.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                //onTap: _signInWithGoogle,
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xff636363)),
                                  ),
                                  child: Image.asset(
                                    'google'.pngImage,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              16.w,
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xff636363)),
                                  ),
                                  child: Image.asset(
                                    'apple'.pngImage,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          16.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              8.w,
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.loginScreen);
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

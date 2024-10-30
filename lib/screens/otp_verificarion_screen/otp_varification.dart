import 'package:e_commerse_app/exports.dart';
import 'package:flutter/gestures.dart';

class OtpVerificationScreen extends StatefulWidget {
  // final String phoneNumber;
  // final String verificationId;

  const OtpVerificationScreen({
    super.key,
    // required this.phoneNumber,
    // required this.verificationId,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  final String staticOtp = '123456';

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

/*
  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Compare entered OTP with static OTP
      if (_otpController.text.trim() == staticOtp) {
        // Sign in with the provided credential
        await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
            verificationId: widget.verificationId,
            smsCode: staticOtp,
          ),
        );

        // Navigate to the new password screen upon successful OTP verification
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => CreateNewPasswordScreen(),
        ));
      } else {
        // Show an error message if OTP is incorrect
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Please try again!')),
        );
      }
    } catch (e) {
      // Handle any unexpected errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error verifying OTP. Please try again!')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Splash'.pngImage,
                height: 200,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Verify OTP',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    16.h,
                    const Text(
                      // 'You need to enter the 6-digit code we sent to\n your Phone number. ${widget.phoneNumber}',
                      'You need to enter the 6-digit code we sent to\n your Phone number',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    32.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        return Container(
                          width: 40,
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xff231F20),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              _otpController.text.isNotEmpty &&
                                      index < _otpController.text.length
                                  ? _otpController.text[index]
                                  : '',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        );
                      }),
                    ),
                    32.h,
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        // onPressed: _isLoading ? null : _verifyOtp,
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(
                                'Confirm',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    24.h,
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Didn't get the code yet? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: 'Resend',
                            style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Resend OTP functionality not implemented')),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    16.h,
                    CustomKeyboard(
                      onNumberSelected: (number) {
                        final text = _otpController.text;
                        if (number == 'DELETE') {
                          if (text.isNotEmpty) {
                            _otpController.text =
                                text.substring(0, text.length - 1);
                            setState(() {});
                          }
                        } else if (number == 'CLEAR') {
                          _otpController.clear();
                          setState(() {});
                        } else {
                          _otpController.text = text + number;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  final Function(String) onNumberSelected;

  const CustomKeyboard({super.key, required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildKey('1')),
                Expanded(child: _buildKey('2')),
                Expanded(child: _buildKey('3')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildKey('4')),
                Expanded(child: _buildKey('5')),
                Expanded(child: _buildKey('6')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildKey('7')),
                Expanded(child: _buildKey('8')),
                Expanded(child: _buildKey('9')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: _buildKey('CLEAR')),
                Expanded(child: _buildKey('0')),
                Expanded(child: _buildKey('DELETE')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () {
        onNumberSelected(value);
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xff231F20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

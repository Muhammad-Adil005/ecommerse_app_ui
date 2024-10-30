import 'package:e_commerse_app/exports.dart';

import '../otp_verificarion_screen/otp_varification.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _obscureText = true;
  final TextEditingController _mobileNumberController = TextEditingController();
  bool _isKeyboardVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  bool _otpSent = false;
  bool _isResendEnabled = false;
  int _secondsRemaining = 35;
  String _countryCode = '+92'; // Default country code

  @override
  void dispose() {
    _mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _isKeyboardVisible = false;
        });
      },
      child: Scaffold(
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
                110.h,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Reset your Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      16.h,
                      const Text(
                        'We need your Phone number so we can send\nyou the password reset code.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      24.h,
                      TextField(
                        controller: _mobileNumberController,
                        style: const TextStyle(color: Colors.white),
                        readOnly: true,
                        onTap: () {
                          setState(() {
                            _isKeyboardVisible = true;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: const TextStyle(color: Colors.grey),
                          fillColor: const Color(0xff231F20),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey[850]!),
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xff636363),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          prefixText: '$_countryCode ', // Display country code
                        ),
                      ),
                      24.h,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _otpSent ? null : _sendOtp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _otpSent ? 'OTP Sent' : 'Send OTP',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      if (_isKeyboardVisible) buildCustomKeyboard(),
                      if (_isResendEnabled)
                        TextButton(
                          onPressed: _sendOtp,
                          child: const Text('Resend OTP'),
                        ),
                    ],
                  ),
                ).padOnly(top: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendOtp() async {
    setState(() {
      _otpSent = false;
      _secondsRemaining = 35;
      _isResendEnabled = false;
      _startCountdown();
    });

    final phoneNumber = '$_countryCode${_mobileNumberController.text.trim()}';
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Phone number verified automatically!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationScreen(
                // phoneNumber: _mobileNumberController.text.trim(),
                // verificationId: _verificationId,
                ),
          ),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification failed. Try again!')),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _otpSent = true;
          _verificationId = verificationId;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP sent to your phone number')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationScreen(
                // phoneNumber: _mobileNumberController.text.trim(),
                // verificationId: verificationId,
                ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        _startCountdown();
      } else {
        setState(() {
          _isResendEnabled = true;
        });
      }
    });
  }

  Widget buildCustomKeyboard() {
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
                Expanded(child: _buildKey('C')),
                Expanded(child: _buildKey('0')),
                Expanded(child: _buildKey('+')),
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
        if (value == 'C') {
          _mobileNumberController.clear();
        } else if (value == '+') {
          _showCountryCodePicker();
        } else {
          _mobileNumberController.text += value;
        }
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

  void _showCountryCodePicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Country Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('United States (+1)'),
              onTap: () {
                setState(() {
                  _countryCode = '+1';
                });
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Pakistan (+92)'),
              onTap: () {
                setState(() {
                  _countryCode = '+92';
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerse_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class PasswordupdateScreen extends StatefulWidget {
  const PasswordupdateScreen({super.key});

  @override
  State<PasswordupdateScreen> createState() => _PasswordupdateScreenState();
}

class _PasswordupdateScreenState extends State<PasswordupdateScreen> {
  bool _obscureText = true; // Password visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 40),
            // Back icon button
            Padding(
              padding: const EdgeInsets.only(right: 260, top: 5),
              child: Container(
                height: 35, // Increased height to accommodate the icon size
                width: 35, // Increased width to accommodate the icon size
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(
                      10), // Optional: adds rounded corners
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left_sharp,
                        size: 20, color: Colors.black),
                    onPressed: () {
                      // Handle back action here
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 5),
            // Logo
            Image.asset(
              'images/Splash.png', // Your logo asset
              height: 180,
            ),
            SizedBox(
              height: 5,
            ),
            // Black container with rounded corners at the top
            Container(
              width: double.infinity,
              // Adjust the margin to align correctly
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40), // Rounded top corners
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Welcome text
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter your details below',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 30),
                  // Mobile Number Field
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.grey[850], // Darker input field color
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff636363),
                        ),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff636363),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: Color(0xff636363)),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.grey[850],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff636363)),
                      ),
                      // Prefix icon for visibility toggle
                      prefixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff636363),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      // Suffix icon for visibility toggle
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff636363),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: Color(0xff636363)),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.grey[850],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Color(0xff636363)),
                      ),
                      // Prefix icon for visibility toggle
                      prefixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff636363),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      // Suffix icon for visibility toggle
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff636363),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    style: TextStyle(color: Color(0xff636363)),
                  ),
                  SizedBox(height: 20),
                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _showPasswordUpdatedDialog(context);
                        // Handle signup action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  // Divider lines with text 'OR'
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Text('Or continue with',
                          style: TextStyle(color: Colors.grey)),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Social media login options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xff636363),
                            )),
                        child: Image.asset(
                          'images/google.png', // Your Google icon asset
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xff636363),
                          ),
                        ),
                        child: Image.asset(
                          'images/apple.png', // Your Apple icon asset
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Sign Up text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle sign-up action
                        },
                        child: Text(
                          'Sign Up',
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
          ]),
        ));
  }
}

// Function to show the "Password Updated" dialog
// Function to show the "Password Updated" dialog
// Function to show the "Password Updated" dialog
void _showPasswordUpdatedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            // Dialog content
            Padding(
              padding: const EdgeInsets.only(top: 50), // Space for the image
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Password updated message
                  Text(
                    "Password has been updated",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Instructions to sign in
                  Text(
                    "Please press sign in to continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Sign In button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD7FC70), // Light green color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          )); // Close the dialog
                      // Navigate to sign-in screen
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Image positioned at the top center
            Positioned(
              top: -50, // Adjust this value to position the image correctly
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 100, // Width of the image container
                  height: 100, // Height of the image container
                  decoration: BoxDecoration(
                    color: Colors.black, // Background color if needed
                    borderRadius:
                        BorderRadius.circular(50), // Circular container
                    border: Border.all(
                        color: Colors.black, width: 2), // Border styling
                  ),
                  child: Center(
                    child: Image.asset(
                      'images/img_14.png', // Your image asset
                      height: 80, // Adjust height to fit within container
                      width: 80, // Adjust width to fit within container
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

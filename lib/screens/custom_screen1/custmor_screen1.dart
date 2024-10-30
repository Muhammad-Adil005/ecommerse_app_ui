import 'package:e_commerse_app/exports.dart';

class CustomScreen1 extends StatelessWidget {
  const CustomScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Image.asset(
                  'img_3'.pngImage,
                  fit: BoxFit.scaleDown,
                ),
                32.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 15,
                      height: 3,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).padOnly(top: 64),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Dressing Well Made Easy',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ).padOnly(top: 16),
                16.h,
                Text(
                  'Discover a Collection That Speaks Volumes\n in Silence',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                  ),
                  textAlign: TextAlign.center,
                ),
                16.h,
                CustomElevatedButton(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.customScreen2);
                  },
                  text: 'Next',
                ),
                16.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.customScreen2);
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                16.h,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

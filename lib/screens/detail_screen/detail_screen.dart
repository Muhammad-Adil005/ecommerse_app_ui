import 'package:e_commerse_app/exports.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;
  final String color;

  const DetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.color,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedSize = 'M';
  Map<String, dynamic>? selectedColor;

  final List<Map<String, dynamic>> colors = [
    {'color': Colors.grey, 'name': 'Grey', 'hex': '#808080'},
    {'color': Colors.pink, 'name': 'Pink', 'hex': '#FFC0CB'},
    {'color': Colors.blue, 'name': 'Blue', 'hex': '#0000FF'},
    {'color': Colors.green, 'name': 'Green', 'hex': '#008000'},
  ];

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Function to add item to Firestore
  Future<void> addToCart(String color, String image, String name, String price,
      String size) async {
    try {
      // Get the current user's ID
      User? currentUser = auth.currentUser;
      if (currentUser != null) {
        // Add item to the user's cart in Firestore
        await firestore
            .collection('carts')
            .doc(currentUser.uid)
            .collection('items')
            .add({
          'name': name,
          'image': image,
          'price': price,
          'color': color,
          'size': size,
          'timestamp': FieldValue.serverTimestamp(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name added to cart!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('You need to sign in to add items to the cart.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add item to cart. Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffE7E7E7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset('img_15'.pngImage, height: 20),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('img_16'.pngImage),
                ),
              ],
            ).padSymmetric(hor: 16),
            Image.asset(
              widget.image,
              height: 270,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            16.h,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
                8.h,
                const Text(
                  'Select Size',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                8.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['S', 'M', 'L', 'XL'].map((size) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedSize == size
                              ? Colors.blue
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: selectedSize == size
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                8.h,
                const Text(
                  'Select Color',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                8.h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: colors.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color['color'],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColor == color
                                ? Colors.black
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                24.h,
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      await addToCart(
                        selectedColor?['name'] ?? widget.color,
                        widget.image,
                        widget.name,
                        widget.price,
                        selectedSize,
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ).padSymmetric(hor: 16),
          ],
        ),
      ),
    );
  }
}

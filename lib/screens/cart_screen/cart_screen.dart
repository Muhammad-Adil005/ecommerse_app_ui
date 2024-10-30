import 'package:e_commerse_app/exports.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> cartItems = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // _loadCartItems();
  }

/*  Future<void> _loadCartItems() async {
    if (user == null) {
      setState(() {
        isLoading = false;
        errorMessage = 'User not logged in';
      });
      return;
    }

    try {
      CollectionReference cartRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('carts');

      QuerySnapshot snapshot = await cartRef.get();

      List<Map<String, dynamic>> items = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id,
          'name': data['name'] ?? 'Unknown',
          'price':
              data.containsKey('price') ? data['price'].toString() : '0.00',
          'image': data['image'] ?? 'images/default_image.png',
          'color': data.containsKey('color') ? data['color'] : '0xFFFFFFFF',
          'size': data.containsKey('size') ? data['size'] : 'N/A',
          'quantity': data.containsKey('quantity') ? data['quantity'] : 1,
        };
      }).toList();

      setState(() {
        cartItems = items;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error loading cart items: $e';
      });
    }
  }

  Future<void> _removeCartItem(String id) async {
    if (user == null) return;

    try {
      CollectionReference cartRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('carts');

      await cartRef.doc(id).delete();

      setState(() {
        cartItems.removeWhere((item) => item['id'] == id);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing item: $e')),
      );
    }
  }

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      double price =
          double.tryParse(item['price'].replaceAll('\$', '')) ?? 0.00;
      int quantity = item['quantity'] ?? 1;
      total += price * quantity;
    }
    return total;
  }

  Future<void> _checkout() async {
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not logged in')),
      );
      return;
    }

    if (cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cart is empty')),
      );
      return;
    }

    try {
      CollectionReference ordersRef = FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('orders');

      double total = getTotalPrice();

      await ordersRef.add({
        'items': cartItems,
        'total': total,
        'date': DateTime.now(),
      });

      // Clear the cart after checkout
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('carts')
          .get()
          .then((snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.delete();
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order placed successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error placing order: $e')),
      );
    }
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString, radix: 16) | 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    // double total = getTotalPrice();
    double shipping = 0.0;
    // double grandTotal = total + shipping;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon press
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : cartItems.isEmpty
              ? const Center(child: Text('Your cart is empty'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          var item = cartItems[index];
                          return ListTile(
                            leading: Image.asset(
                              item['image'],
                              height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image_not_supported);
                              },
                            ),
                            title: Text(item['name']),
                            subtitle: Text(
                                '\$${item['price']} x ${item['quantity']}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              // onPressed: () => _removeCartItem(item['id']),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total'),
                            // Text('\$${total.toStringAsFixed(2)}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Shipping'),
                            Text('\$${shipping.toStringAsFixed(2)}'),
                          ],
                        ),
                        const Divider(),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Grand Total'),
                            // Text('\$${grandTotal.toStringAsFixed(2)}'),
                          ],
                        ),
                        16.h,
                        SizedBox(
                          width: double.infinity,
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
                            // onPressed: _checkout,
                            onPressed: () {},
                            child: const Text('Checkout'),
                          ),
                        ),
                      ],
                    ).padAll(20),
                  ],
                ),
    );
  }
}

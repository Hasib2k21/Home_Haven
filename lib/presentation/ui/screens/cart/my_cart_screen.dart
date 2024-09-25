import 'package:flutter/material.dart';
import '../../utils/product_description/product.dart';

class MyCartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const MyCartScreen({super.key, required this.cartItems});

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late List<Product> cartItems;
  Map<Product, int> quantities = {};

  @override
  void initState() {
    super.initState();
    cartItems = widget.cartItems;
    quantities = {for (var item in cartItems) item: 1}; // Initialize quantities
  }

  void _removeItem(Product product) {
    setState(() {
      cartItems.remove(product);
      quantities.remove(product);
    });
  }

  void _updateQuantity(Product product, int quantity) {
    setState(() {
      quantities[product] = quantity;
    });
  }

  double _calculateTotalPrice() {
    return cartItems.fold(0, (total, product) {
      return total + (product.price * quantities[product]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return CartItemWidget(
                  product: product,
                  quantity: quantities[product]!,
                  onDelete: () => _removeItem(product),
                  onQuantityChanged: (quantity) => _updateQuantity(product, quantity),
                );
              },
            ),
          ),
          _buildTotalSection(),
        ],
      ),
    );
  }

  Widget _buildTotalSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Text('\$${_calculateTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Proceeding to Payment')),
                );
              },
              child: const Text('Proceed to Payment'),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.product,
    required this.quantity,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: _buildBoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            const SizedBox(width: 15),
            Expanded(child: _buildProductDetails()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 24,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return SizedBox(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          product.images[0],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        _buildPriceAndDeleteRow(),
        const SizedBox(height: 4),
        _buildDiscountInfo(),
        const SizedBox(height: 8),
        const Text('Yellow'), // Example text for product color
        const SizedBox(height: 8),
        _buildQuantityControl(),
      ],
    );
  }

  Widget _buildPriceAndDeleteRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$${(product.price * quantity).toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: onDelete),
      ],
    );
  }

  Widget _buildDiscountInfo() {
    return Row(
      children: [
        Text('\$${(product.price * 2).toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.grey, fontSize: 14, decoration: TextDecoration.lineThrough)),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(6)),
          child: const Text('45% OFF', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.favorite_border),
        QuantityControl(quantity: quantity, onQuantityChanged: onQuantityChanged),
      ],
    );
  }
}

class QuantityControl extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantityControl({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  void _incrementQuantity() {
    onQuantityChanged(quantity + 1);
  }

  void _decrementQuantity() {
    if (quantity > 1) onQuantityChanged(quantity - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: _decrementQuantity, padding: EdgeInsets.zero),
          Text('$quantity', style: const TextStyle(fontSize: 14)),
          IconButton(icon: const Icon(Icons.add), onPressed: _incrementQuantity, padding: EdgeInsets.zero),
        ],
      ),
    );
  }
}

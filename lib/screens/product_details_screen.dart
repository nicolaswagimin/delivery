import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../utils/app_colors.dart';
import '../providers/cart_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double _spicyLevel = 0.0;
  int _quantity = 1;
  final List<String> _selectedToppings = [];

  static const List<String> toppings = [
    'Lettuce',
    'Tomato',
    'Cheese',
    'Onion',
    'Pickle',
    'Bacon',
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context, cartProvider),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            const SizedBox(height: 24),
            _buildProductTitle(),
            const SizedBox(height: 24),
            _buildSpicySlider(),
            const SizedBox(height: 32),
            _buildToppingsSection(),
            const SizedBox(height: 32),
            _buildQuantityAndTotal(),
            const SizedBox(height: 40),
            _buildOrderNowButton(context, cartProvider),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    CartProvider cartProvider,
  ) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        Consumer<CartProvider>(
          builder: (context, provider, child) {
            return IconButton(
              icon: Icon(
                provider.isFavorite(widget.product.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: provider.isFavorite(widget.product.id)
                    ? AppColors.primary
                    : Colors.black,
              ),
              onPressed: () {
                cartProvider.toggleFavorite(widget.product.id);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          widget.product.imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.name,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text(
              '4.5 - 30 mins',
              style: GoogleFonts.poppins(
                color: AppColors.textLight,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'The Cheeseburger Wendy\'s Burger is a classic, but our spicy version will blow your mind!',
          style: GoogleFonts.poppins(
            color: AppColors.textLight,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSpicySlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customize you burger to taste. Update the spicy level',
          style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textLight),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              'Spicy',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 8,
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: AppColors.greyLight,
                  thumbColor: AppColors.primary,
                  overlayColor: AppColors.primary.withOpacity(0.2),
                ),
                child: Slider(
                  value: _spicyLevel,
                  min: 0,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      _spicyLevel = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToppingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Toppings',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: toppings.map((topping) {
            final isSelected = _selectedToppings.contains(topping);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedToppings.remove(topping);
                  } else {
                    _selectedToppings.add(topping);
                  }
                });
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.greyLight,
                    width: isSelected ? 2.5 : 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: AppColors.greyLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      topping,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildQuantityAndTotal() {
    final total =
        (widget.product.price + (_selectedToppings.length * 0.99)) * _quantity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildQuantityButton(Icons.remove, () {
              if (_quantity > 1) setState(() => _quantity--);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                _quantity.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildQuantityButton(Icons.add, () {
              setState(() => _quantity++);
            }),
          ],
        ),
        Text(
          '\$${total.toStringAsFixed(2)}',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildOrderNowButton(BuildContext context, CartProvider cartProvider) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          cartProvider.addToCart(widget.product);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product added to cart!')),
          );
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Text(
              'ORDER NOW',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(Icons.arrow_forward, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

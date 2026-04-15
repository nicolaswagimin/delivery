import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'product_details_screen.dart';
import 'user_profile_screen.dart';
import 'cart_screen.dart';
import 'customer_support_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> categories = [
    'All',
    'Combos',
    'Sliders',
    'Classical',
    'Pizza',
    'Drinks',
    'Desserts',
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              _buildLogo(),
              const SizedBox(height: 60),
              _buildSearchAndFilter(),
              const SizedBox(height: 24),
              _buildCategories(),
              const SizedBox(height: 24),
              _buildProductGrid(context, cartProvider),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildCartFab(context, cartProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildLogo() {
    return Text(
      'Foodgo',
      style: GoogleFonts.lobster(
        fontSize: 45,
        color: AppColors.textDark,
        height: 1.34688,
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 19,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColors.textLight,
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.textLight),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 13),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.tune, color: AppColors.white, size: 24),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = index == 0;
          return Padding(
            padding: EdgeInsets.only(
              right: index < categories.length - 1 ? 10 : 0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                category,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? AppColors.white : AppColors.textLight,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, CartProvider cartProvider) {
    final products = [
      Product(
        id: '1',
        name: 'Cheeseburger Wendy\'s Burger',
        image:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
        price: 8.24,
        rating: 4.9,
      ),
      Product(
        id: '2',
        name: 'Hamburger Veggie Burger',
        image:
            'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400',
        price: 6.99,
        rating: 4.8,
      ),
      Product(
        id: '3',
        name: 'Hamburger Chicken Burger',
        image:
            'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=400',
        price: 7.49,
        rating: 4.6,
      ),
      Product(
        id: '4',
        name: 'Fried Chicken Burger',
        image:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
        price: 8.99,
        rating: 4.5,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(context, products[index], cartProvider);
      },
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    Product product,
    CartProvider cartProvider,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.grey,
                      child: Center(
                        child: Icon(
                          Icons.fastfood,
                          size: 40,
                          color: AppColors.greyMedium,
                        ),
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: const Color(0xFFFF9B00),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        product.rating.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.textDark,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: AppColors.textDark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartFab(BuildContext context, CartProvider cartProvider) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, size: 32),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: AppColors.primary,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, size: 28),
              color: AppColors.white,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, size: 28),
              color: AppColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  ),
                );
              },
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: const Icon(Icons.chat_outlined, size: 28),
              color: AppColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomerSupportScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_outline, size: 28),
              color: AppColors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

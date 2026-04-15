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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              _buildHeader(),
              const SizedBox(height: 40),
              _buildSearchAndFilter(),
              const SizedBox(height: 24),
              _buildCategories(),
              const SizedBox(height: 24),
              _buildProductGrid(context, cartProvider),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildCartFab(context, cartProvider),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Foodgo',
          style: GoogleFonts.lobster(
            fontSize: 45,
            color: const Color(0xFF3C2F2F),
            height: 1.34688,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Order your favourite food!',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF6A6A6A),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
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
                hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3C2F2F),
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.search, color: Color(0xFF3C2F2F)),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 50),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
        ),
        const SizedBox(width: 13),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFEF2A39),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.tune, color: Colors.white, size: 28),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: categories.asMap().entries.map((entry) {
          final index = entry.key;
          final category = entry.value;
          final isSelected = index == 0;
          return Padding(
            padding: EdgeInsets.only(
              right: index < categories.length - 1 ? 14 : 0,
            ),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFEF2A39) : const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                category,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFFF5F5F5) : const Color(0xFF6A6A6A),
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
        description: 'A classic fast food burger.',
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
        price: 8.24,
        rating: 4.9,
      ),
      Product(
        id: '2',
        name: 'Hamburger Veggie Burger',
        description: 'A delicious veggie burger.',
        imageUrl:
            'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400',
        price: 6.99,
        rating: 4.8,
      ),
      Product(
        id: '3',
        name: 'Hamburger Chicken Burger',
        description: 'Tender chicken burger.',
        imageUrl:
            'https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=400',
        price: 7.49,
        rating: 4.6,
      ),
      Product(
        id: '4',
        name: 'Hamburger Fried Chicken Burger',
        description: 'Crispy fried chicken burger.',
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400',
        price: 8.99,
        rating: 4.5,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 185 / 225,
        crossAxisSpacing: 22,
        mainAxisSpacing: 30,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.13),
              blurRadius: 17,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: -4,
                          child: Container(
                            width: 90,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          width: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.fastfood, size: 40, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.name,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3C2F2F),
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 11,
              bottom: 12,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Color(0xFFFF9633),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    product.rating.toString(),
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3C2F2F),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 12,
              bottom: 12,
              child: const Icon(
                Icons.favorite_border,
                size: 24,
                color: Color(0xFF3C2F2F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartFab(BuildContext context, CartProvider cartProvider) {
    return SizedBox(
      width: 72,
      height: 72,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CartScreen()),
          );
        },
        backgroundColor: const Color(0xFFEF2A39),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
        elevation: 8,
        child: const Icon(Icons.add, size: 36, color: Colors.white),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 12,
      color: const Color(0xFFEF2A39),
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, true, () {}),
            _buildNavItem(Icons.person_outline, false, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserProfileScreen()),
              );
            }),
            const SizedBox(width: 48), // gap for FAB
            _buildNavItem(Icons.chat_bubble_outline, false, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomerSupportScreen()),
              );
            }),
            _buildNavItem(Icons.favorite_border, false, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritesScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: Colors.white),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

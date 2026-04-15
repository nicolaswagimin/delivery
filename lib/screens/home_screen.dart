import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/home_header_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/cart_fab_widget.dart';
import '../providers/cart_provider.dart';
import 'product_details_screen.dart';
import 'user_profile_screen.dart';
import 'cart_screen.dart';
import 'customer_support_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> categories = [
    AppStrings.all,
    AppStrings.pizza,
    AppStrings.burger,
    AppStrings.sushi,
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidget(
                onMenuTap: () => _showMenu(context),
                onProfileTap: () => _navigateToProfile(context),
              ),
              const SizedBox(height: 32),
              const HomeTitleWidget(),
              const SizedBox(height: 24),
              const HomeSearchWidget(),
              const SizedBox(height: 40),
              const Text(
                AppStrings.popularCategories,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CategoryListWidget(
                categories: categories,
                selectedCategory: cartProvider.selectedCategory,
                onCategorySelected: (category) {
                  cartProvider.selectCategory(category);
                  _showSnackbar(context, AppStrings.categorySelected);
                },
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: demoProducts.length,
                  itemBuilder: (context, index) {
                    final product = demoProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () => _navigateToProductDetails(context, product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CartFabWidget(
        itemCount: cartProvider.itemCount,
        onTap: () => _navigateToCart(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBarWidget(
        onHomeTap: () {},
        onFavoritesTap: () => _navigateToFavorites(context),
        onProfileTap: () => _navigateToProfile(context),
        onChatTap: () => _navigateToSupport(context),
      ),
    );
  }

  void _navigateToProductDetails(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      ),
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserProfileScreen()),
    );
  }

  void _navigateToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  void _navigateToSupport(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CustomerSupportScreen()),
    );
  }

  void _navigateToFavorites(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
    );
  }

  void _showMenu(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Menu feature coming soon')));
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}

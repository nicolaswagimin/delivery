import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../providers/cart_provider.dart';
import '../widgets/product_details_widgets.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final isFavorite = context.select<CartProvider, bool>(
      (provider) => provider.isFavorite(product.id),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? AppColors.primary : Colors.black,
            ),
            onPressed: () {
              cartProvider.toggleFavorite(product.id);
              _showSnackbar(context, AppStrings.favorite);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageWidget(product: product),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  ProductTitleWidget(product: product),
                  const SizedBox(height: 30),
                  ProductInfoSectionWidget(
                    title: AppStrings.deliveryInfo,
                    content: AppStrings.deliveryDetails,
                  ),
                  const SizedBox(height: 30),
                  ProductInfoSectionWidget(
                    title: AppStrings.returnPolicy,
                    content: AppStrings.returnDetails,
                  ),
                  const SizedBox(height: 50),
                  AddToCartButtonWidget(
                    onPressed: () {
                      cartProvider.addToCart(product);
                      _showSnackbar(context, AppStrings.productAdded);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

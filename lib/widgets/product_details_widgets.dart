import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class ProductImageWidget extends StatelessWidget {
  final Product product;

  const ProductImageWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.network(
          product.imageUrl,
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductTitleWidget extends StatelessWidget {
  final Product product;

  const ProductTitleWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}

class ProductInfoSectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const ProductInfoSectionWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
      ],
    );
  }
}

class AddToCartButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const AddToCartButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        AppStrings.addToCart,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

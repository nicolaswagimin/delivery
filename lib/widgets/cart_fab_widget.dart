import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CartFabWidget extends StatelessWidget {
  final VoidCallback onTap;
  final int itemCount;

  const CartFabWidget({
    super.key,
    required this.onTap,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: AppColors.primary,
      elevation: 10,
      shape: const CircleBorder(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.shopping_cart, color: Colors.white, size: 32),
          if (itemCount > 0)
            Positioned(
              right: -8,
              top: -8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  itemCount > 99 ? '99+' : itemCount.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

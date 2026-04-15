import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../providers/cart_provider.dart';
import '../screens/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          AppStrings.checkout,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.paymentMethod,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildPaymentOption(
                    context,
                    icon: Icons.credit_card,
                    color: Colors.orange,
                    label: AppStrings.card,
                    isSelected: cartProvider.selectedPaymentMethod == AppStrings.card,
                  ),
                  const Divider(),
                  _buildPaymentOption(
                    context,
                    icon: Icons.account_balance,
                    color: Colors.pink,
                    label: AppStrings.bankAccount,
                    isSelected: cartProvider.selectedPaymentMethod == AppStrings.bankAccount,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              AppStrings.deliveryMethod,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _buildDeliveryOption(
                    context,
                    label: AppStrings.doorDelivery,
                    isSelected: cartProvider.selectedDeliveryMethod == AppStrings.doorDelivery,
                  ),
                  const Divider(),
                  _buildDeliveryOption(
                    context,
                    label: AppStrings.pickUp,
                    isSelected: cartProvider.selectedDeliveryMethod == AppStrings.pickUp,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  AppStrings.total,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '\$${cartProvider.total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _showSuccessDialog(context, cartProvider),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                AppStrings.proceedToPayment,
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false).selectPaymentMethod(label);
      },
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: (value) {
              Provider.of<CartProvider>(context, listen: false).selectPaymentMethod(label);
            },
            activeColor: AppColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Text(label, style: const TextStyle(fontSize: 17)),
        ],
      ),
    );
  }

  Widget _buildDeliveryOption(
    BuildContext context, {
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        Provider.of<CartProvider>(context, listen: false).selectDeliveryMethod(label);
      },
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: (value) {
              Provider.of<CartProvider>(context, listen: false).selectDeliveryMethod(label);
            },
            activeColor: AppColors.primary,
          ),
          Text(label, style: const TextStyle(fontSize: 17)),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, CartProvider cartProvider) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFF2F2F2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 50, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              AppStrings.success,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              AppStrings.paymentSuccess,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                cartProvider.clearCart();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                AppStrings.backToHome,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

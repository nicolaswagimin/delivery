import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'home_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildAppBar(context),
              const SizedBox(height: 40),
              _buildOrderSummary(),
              const SizedBox(height: 40),
              _buildPaymentMethods(),
              const SizedBox(height: 40),
              _buildSaveCardOption(),
              const SizedBox(height: 80),
              _buildTotalAndPayNow(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Color(0xFF3C2F2F)),
          onPressed: () => Navigator.pop(context),
        ),
        IconButton(
          icon: const Icon(Icons.search, size: 24, color: Color(0xFF3C2F2F)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order summary',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3C2F2F),
          ),
        ),
        const SizedBox(height: 30),
        _buildSummaryRow('Order', '\$16.48'),
        const SizedBox(height: 20),
        _buildSummaryRow('Taxes', '\$0.3'),
        const SizedBox(height: 20),
        _buildSummaryRow('Delivery fees', '\$1.5'),
        const SizedBox(height: 30),
        _buildSummaryRow('Total:', '\$18.19', isTotal: true),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Estimated delivery time:',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xFF3C2F2F),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '15 - 30mins',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xFF3C2F2F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: Color(0xFF3C2F2F),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: isTotal ? 18 : 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: Color(0xFF3C2F2F),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment methods',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3C2F2F),
          ),
        ),
        const SizedBox(height: 30),
        _buildPaymentMethodCard('Credit card', '5105 **** **** 0505', true),
        const SizedBox(height: 20),
        _buildPaymentMethodCard('Debit card', '3566 **** **** 0505', false),
      ],
    );
  }

  Widget _buildPaymentMethodCard(String label, String number, bool isSelected) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF443333) : Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Color(0xFF3C2F2F),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              number,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isSelected ? Colors.white.withOpacity(0.7) : Color(0xFF3C2F2F).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveCardOption() {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color(0xFFEF2A39),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 14),
        ),
        const SizedBox(width: 12),
        Text(
          'Save card details for future payments',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xFF3C2F2F),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalAndPayNow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total price',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFF3C2F2F).withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$18.19',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFEF2A39),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Color(0xFF443333),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                _showSuccessDialog(context);
              },
              child: Center(
                child: Text(
                  'Pay Now',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFEF2A39),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 24),
              Text(
                'Success !',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C2F2F),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Your payment was successful. Your food is on the way!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color(0xFF3C2F2F).withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEF2A39),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Go Back',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

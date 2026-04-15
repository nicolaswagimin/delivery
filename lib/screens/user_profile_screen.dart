import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(context),
            _buildWhiteSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.2),
          radius: 0.6,
          colors: [Color(0xFFFF2A9D), Color(0xFFEF2A39)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 26,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Positioned(
            right: 20,
            top: 28,
            child: IconButton(
              icon: const Icon(Icons.settings, size: 24, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: const Color(0xFFEF2A39), width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 43, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Name', 'Sophia Patel'),
          const SizedBox(height: 30),
          _buildTextField('Email', 'sophiapatel@gmail.com'),
          const SizedBox(height: 30),
          _buildTextField('Delivery address', '123 Main St Apartment 4A,New York, NY'),
          const SizedBox(height: 30),
          _buildTextField('Password', '••••••••••', isPassword: true),
          const SizedBox(height: 50),
          Container(
            width: 343,
            height: 1,
            color: const Color(0xFFE8E8E8),
          ),
          const SizedBox(height: 30),
          _buildMenuItem('Payment Details'),
          const SizedBox(height: 30),
          _buildMenuItem('Order history'),
          const SizedBox(height: 80),
          _buildButtons(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String value, {bool isPassword = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 343,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE0E0E0), width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3C2F2F),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          top: -12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.white,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF999999),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title) {
    return SizedBox(
      width: 343,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF999999),
            ),
          ),
          const Icon(Icons.chevron_right, size: 24, color: Color(0xFF999999)),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFF443333),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.edit, size: 24, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFEF2A39), width: 2),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log out',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFEF2A39),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.logout, size: 24, color: Color(0xFFEF2A39)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

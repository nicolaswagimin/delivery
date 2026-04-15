import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class HomeHeaderWidget extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onProfileTap;

  const HomeHeaderWidget({
    super.key,
    required this.onMenuTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMenuButton(),
        _buildProfileAvatar(),
      ],
    );
  }

  Widget _buildMenuButton() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.menu, color: Colors.white),
    );
  }

  Widget _buildProfileAvatar() {
    return GestureDetector(
      onTap: onProfileTap,
      child: const CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
          'https://i.pravatar.cc/150?u=a042581f4e29026704d',
        ),
      ),
    );
  }
}

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.welcomeText,
      style: GoogleFonts.poppins(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        height: 1.2,
      ),
    );
  }
}

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: AppStrings.search,
        prefixIcon: const Icon(Icons.search, color: AppColors.black),
        filled: true,
        fillColor: const Color(0xFFEFEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),
    );
  }
}

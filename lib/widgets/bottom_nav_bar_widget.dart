import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class BottomNavBarWidget extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onFavoritesTap;
  final VoidCallback onProfileTap;
  final VoidCallback onChatTap;

  const BottomNavBarWidget({
    super.key,
    required this.onHomeTap,
    required this.onFavoritesTap,
    required this.onProfileTap,
    required this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, AppStrings.home, onHomeTap),
            _buildNavItem(Icons.favorite_outline, AppStrings.favorites, onFavoritesTap),
            const SizedBox(width: 48),
            _buildNavItem(Icons.person_outline, AppStrings.profile, onProfileTap),
            _buildNavItem(Icons.chat_bubble_outline, AppStrings.chat, onChatTap),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String tooltip, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onTap,
      tooltip: tooltip,
    );
  }
}

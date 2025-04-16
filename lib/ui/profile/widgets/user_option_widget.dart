import 'package:flutter/material.dart';
import 'package:rm_systems_mobile/core/widgets/icon_button_circle_widget.dart';

class UserOptionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const UserOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButtonCircleWidget(
                  icon: icon,
                  iconColor: Theme.of(context).primaryColor,
                  showShadow: false,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
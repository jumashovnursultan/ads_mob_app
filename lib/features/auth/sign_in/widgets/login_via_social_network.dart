import 'package:ads_mobile_app/shared_widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomLoginViaSocialNetworkWidget extends StatelessWidget {
  const CustomLoginViaSocialNetworkWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final AppIcons icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF000000),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(icon),
          const Gap(8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

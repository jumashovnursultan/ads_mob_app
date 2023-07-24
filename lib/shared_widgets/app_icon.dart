import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  // ignore: constant_identifier_names
  google_logo,
  // ignore: constant_identifier_names
  apple_logo,
  // ignore: constant_identifier_names
  facebook_logo
}

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final double? size;
  final Color? color;
  final bool originalColor;

  const AppIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
    this.originalColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/${icon.name}.svg',
          colorFilter: originalColor
              ? null
              : ColorFilter.mode(
                  color ?? IconTheme.of(context).color!,
                  BlendMode.srcIn,
                ),
          height: size,
          width: size,
        ),
      ),
    );
  }
}

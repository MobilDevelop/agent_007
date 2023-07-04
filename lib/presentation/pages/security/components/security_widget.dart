import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({
    super.key, required this.title, required this.onPress,
  });
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return f_bounce.Bounce(
      onPressed:onPress,
      duration: const Duration(milliseconds: 150),
      child: Container(
        height: 87,
        width: 87,
        decoration: BoxDecoration(
            border: Border.all(
                color: AppTheme.colors.primary,
                 width: 1.5),
            color: Colors.white,
            shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(title,
            style: AppTheme.data.textTheme.headlineSmall!.copyWith(color: AppTheme.colors.primary)),
      ),
    );
  }
}
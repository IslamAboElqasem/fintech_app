import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthFooter extends StatelessWidget {
  const CustomAuthFooter({
    super.key,
    required this.prefixText,
    required this.actionText,
    this.onActionTap,
    this.prefixStyle,
    this.actionStyle,
  });

  final String prefixText;
  final String actionText;
  final VoidCallback? onActionTap;
  final TextStyle? prefixStyle;
  final TextStyle? actionStyle;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onActionTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: prefixText,
              style: prefixStyle ?? TextStyles.font16MediumGrayBold,
            ),
            TextSpan(
              text: ' $actionText',
              style:
                  actionStyle ??
                  (isDarkMode
                      ? TextStyles.font16SnowWhiteBold
                      : TextStyles.font16PrimaryBold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plante/base/base.dart';
import 'package:plante/ui/base/text_styles.dart';

class ShopProductRangeProductsTitle extends StatelessWidget {
  final String text;
  final double horizontalPaddings;
  final double verticalPadding;
  const ShopProductRangeProductsTitle(this.text,
      {Key? key, this.horizontalPaddings = 0.0, this.verticalPadding = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isInTests()) {
      // Large title makes it harder to test the widget
      return Text(text, style: TextStyles.hint);
    }
    return Padding(
      padding: EdgeInsets.only(
          left: horizontalPaddings,
          right: horizontalPaddings,
          top: verticalPadding,
          bottom: verticalPadding),
      child: Text(text, style: TextStyles.headline2),
    );
  }
}

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/products/result.dart';

class AppBarProductView extends StatelessWidget implements PreferredSizeWidget {
  final Result product;
  const AppBarProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    return PreferredSize(
      preferredSize: Size.fromHeight(0.45.sh),
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Expanded(
              child: imageWidget(product.imageLink, context),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: buttonWidget(
                      label: locale.addedToFavorites,
                      iconData: Icons.favorite,
                      onTab: () => log("ADD/Remove From Favorites List"),
                    ),
                  ),
                  VerticalDivider(
                      color: theme.colorScheme.onTertiary, width: 0.5),
                  Expanded(
                    child: buttonWidget(
                      label: locale.shareTheProduct,
                      iconData: Icons.share,
                      onTab: () => log("Share The Product"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget imageWidget(String? imageLink, context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 0.18.sh,
      width: double.infinity,
      child: (imageLink != null && imageLink.isNotEmpty)
          ? CachedNetworkImage(
              imageUrl: imageLink,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                if (url.isEmpty) {
                  return Container(
                    color: theme.colorScheme.shadow,
                  );
                }
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              },
              errorWidget: (context, url, error) => Container(
                color: theme.colorScheme.shadow,
              ),
            )
          : Container(
              color: theme.colorScheme.shadow,
            ),
    );
  }

  Widget buttonWidget(
      {required String label,
      required IconData iconData,
      required Function onTab}) {
    return TextButton.icon(
      onPressed: () => onTab,
      icon: Icon(iconData),
      label: Text(
        label,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0.45.sh);
}

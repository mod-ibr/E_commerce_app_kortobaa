import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:e_commerce_app/features/home_view/data/models/products/result.dart'
    as pro;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardHomeView extends StatelessWidget {
  final pro.Result product;
  const ProductCardHomeView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    return Container(
      width: 0.35.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: theme.colorScheme.tertiary),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imageWidget(product.imageLink, context),
              SizedBox(height: 8.sp),
              Text(
                product.description ?? locale.noTitle,
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  product.price != null
                      ? Row(
                          children: [
                            Text(
                              "${product.price} ",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              locale.egp,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  IconButton(
                    onPressed: () => log("Add ${product.name} to Cart"),
                    icon: const Icon(Icons.add_shopping_cart_rounded),
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageWidget(String? imageLink, context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 0.12.sh,
      child: (imageLink != null && imageLink.isNotEmpty)
          ? CachedNetworkImage(
              imageUrl: imageLink,
              fit: BoxFit.contain,
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
}

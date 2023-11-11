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
      width: 0.55.sw,
      height: 0.35.sh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: theme.colorScheme.tertiary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: imageWidget(product.imageLink, context),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.sp, left: 8.sp, right: 8.sp),
                  child: Text(
                    product.description ?? locale.noTitle,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      product.price != null
                          ? Row(
                              children: [
                                Text(
                                  "${product.price} ",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                      color: theme.colorScheme.secondary),
                                ),
                                Text(
                                  locale.egp,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w800,
                                      color: theme.colorScheme.secondary),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      IconButton(
                        onPressed: () => log("Add ${product.name} to Cart"),
                        icon: Icon(
                          Icons.add_shopping_cart_rounded,
                          size: 30.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget imageWidget(String? imageLink, context) {
    final theme = Theme.of(context);

    return (imageLink != null && imageLink.isNotEmpty)
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
          );
  }
}

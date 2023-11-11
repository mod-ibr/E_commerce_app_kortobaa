import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/localization/l10n.dart';
import 'package:e_commerce_app/core/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../home_view/data/models/products/result.dart';
import '../../../../home_view/presentation/views/widgets/product_view_widgets/product_view_amount_row.dart';

class ProductItemCartView extends StatelessWidget {
  final Result product;
  const ProductItemCartView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 0.22.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //* Image  + Description + Price
          itemContent(product: product, context: context),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.3),
              ),
            ),
            child: AmountRowProductView(
              price: product.price!,
              endChild: IconButtonCustom(
                iconData: Icons.delete_forever,
                onPressed: () {
                  // TODO : Remove Item From Cart
                },
                color: theme.colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget itemContent({required Result product, required BuildContext context}) {
    final theme = Theme.of(context);
    final locale = getL10n(context);

    return Container(
      color: theme.colorScheme.tertiary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //* Image
          Expanded(
            flex: 1,
            child: imageWidget(product.imageLink, context),
          ),
          //* Description + price
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //* Description
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.sp),
                    child: Text(
                      product.description ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //* Price
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: product.price != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                product.price!.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                              SizedBox(width: 6.sp),
                              Text(
                                locale.egp,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: theme.colorScheme.secondary,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
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
      height: 0.15.sh,
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
}

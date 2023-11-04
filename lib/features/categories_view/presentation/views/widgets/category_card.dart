import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/categories/result.dart';

class CategoryCard extends StatelessWidget {
  final Result result;
  const CategoryCard({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final String? imageLink = result.imageLink;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            imageWidget(imageLink, context),
            label(result.name, context)
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

  Widget label(String? name, context) {
    final theme = Theme.of(context);

    return Text(
      result.name ?? "",
      style: theme.textTheme.displaySmall?.copyWith(
        color: theme.colorScheme.tertiary,
        //text stroke
        shadows: [
          Shadow(
              // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: theme.colorScheme.onTertiary),
          Shadow(
              // bottomRight
              offset: const Offset(1.5, -1.5),
              color: theme.colorScheme.onTertiary),
          Shadow(
              // topRight
              offset: const Offset(1.5, 1.5),
              color: theme.colorScheme.onTertiary),
          Shadow(
              // topLeft
              offset: const Offset(-1.5, 1.5),
              color: theme.colorScheme.onTertiary),
        ],
      ),
    );
  }
}

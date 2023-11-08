import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCircleAvatarHomeView extends StatelessWidget {
  final String? imageLink, label;
  const CategoryCircleAvatarHomeView(
      {super.key, required this.imageLink, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.w,
      child: Column(
        children: [
          imageWidget(imageLink, context),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 8.0),
            child: Text(
              "$label $label $label $label $label $label $label $label ",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          )
        ],
      ),
    );
  }

  Widget imageWidget(String? imageLink, context) {
    final theme = Theme.of(context);

    return CircleAvatar(
      backgroundColor: theme.colorScheme.primary,
      radius: 28.sp,
      child: SizedBox(
        width: 100.sp,
        height: 100.sp,
        child: ClipOval(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: (imageLink != null && imageLink.isNotEmpty)
              ? CachedNetworkImage(
                  imageUrl: imageLink,
                  fit: BoxFit.fill,
                  placeholder: (context, url) {
                    if (url.isEmpty) {
                      return Container(
                        color: theme.colorScheme.shadow,
                      );
                    }
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                          color: theme.colorScheme.tertiary),
                    );
                  },
                  errorWidget: (context, url, error) => Container(
                    color: theme.colorScheme.shadow,
                  ),
                )
              : Container(
                  color: theme.colorScheme.shadow,
                ),
        ),
      ),
    );
  }
}

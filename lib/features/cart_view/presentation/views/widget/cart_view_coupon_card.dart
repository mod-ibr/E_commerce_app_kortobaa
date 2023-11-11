import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/assets/assets_images.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../../core/presentation/views/widgets/elevated_bttn_custom.dart';

class CouponCardCartView extends StatefulWidget {
  const CouponCardCartView({super.key});

  @override
  State<CouponCardCartView> createState() => _CouponCardCartViewState();
}

class _CouponCardCartViewState extends State<CouponCardCartView> {
  TextEditingController couponController = TextEditingController();
  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = getL10n(context);
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          SvgPicture.asset(
            AssetsImages.coupon,
            // height: 0.2.sw,
            width: 1.sw,
            fit: BoxFit.fill,
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(vertical: 12.sp),
            width: 0.7.sw,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  locale.haveCoupon,
                  style: TextStyle(
                      color: theme.colorScheme.tertiary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20.sp),
                enterCouponWidget()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget enterCouponWidget() {
    final locale = getL10n(context);
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
            height: 35.sp,
            width: 0.4.sw,
            padding: EdgeInsetsDirectional.only(end: 8.sp),
            child: TextFormField(
              controller: couponController,
              style: theme.textTheme.labelLarge
                  ?.copyWith(color: theme.colorScheme.secondary),
              decoration: InputDecoration(
                hintText: locale.enterCoupon,
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.onTertiary),
                filled: true,
                fillColor: theme.colorScheme.surface.withOpacity(0.7),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.colorScheme.onPrimary),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                    vertical: 10, horizontal: 20),
              ),
            )),
        SizedBox(
          height: 35.sp,
          width: 0.26.sw,
          child: ElevatedBttnCustom(
            onTap: () {},
            title: locale.apply,
            fontSize: 12.sp,
            backgroundColor: theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/l10n.dart';
import '../../manager/products cubit/products_cubit.dart';
import '../../manager/products cubit/products_state.dart';
import 'home_view_app_bar_header.dart';
import 'home_view_blurred_image.dart';
import 'home_view_products_slider.dart';
import 'home_view_search_field.dart';

class AppBarHomeView extends StatelessWidget {
  const AppBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = getL10n(context);
    final double height = 0.45.sh;
    final productsCubitProvider = getProductsCubit(context);
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.green, width: 2)),
          child: BlurredImageHomeView(
            image: productsCubitProvider.productsImageSliderList[
                productsCubitProvider.selectedSliderImage],
            height: height,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.only(bottom: 8.sp, top: 4.sp),
                      child: AppBarHeaderHomeView(title: locale.main),
                    ),
                    const SearchFieldHomeView(),
                    ProductsSliderHomeView(height: height)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

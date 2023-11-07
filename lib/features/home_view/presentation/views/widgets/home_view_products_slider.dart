import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/views/widgets/home_view_slider_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductsSliderHomeView extends StatelessWidget {
  final double height;
  ProductsSliderHomeView({super.key, required this.height});

  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final productsCubitProvider = getProductsCubit(context);
    final imagesList = productsCubitProvider.productsImageSliderList;
    final theme = Theme.of(context);
    final widgetHeight = height * 0.6;
    return SizedBox(
      height: widgetHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsetsDirectional.only(top: 8.sp, bottom: 19.sp),
            height: widgetHeight * 0.9,
            child: PageView.builder(
              onPageChanged: (value) => productsCubitProvider
                  .sliderOnChange(value % imagesList.length),
              physics: const BouncingScrollPhysics(),
              controller: controller,
              itemCount: imagesList.length,
              itemBuilder: (_, index) {
                return SliderImagesHomeView(
                    image: imagesList[index % imagesList.length]);
              },
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: imagesList.length,
            effect: CustomizableEffect(
              spacing: 4.sp,
              dotDecoration: DotDecoration(
                  color: theme.colorScheme.scrim,
                  borderRadius: BorderRadius.circular(12),
                  width: 13.sp,
                  height: 3.sp),
              activeDotDecoration: DotDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                  width: 13.sp,
                  height: 3.sp),
            ),
          ),
        ],
      ),
    );
  }
}

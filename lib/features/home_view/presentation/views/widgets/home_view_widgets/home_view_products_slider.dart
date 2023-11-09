import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_view_slider_images.dart';

class ProductsSliderHomeView extends StatefulWidget {
  final double height;
  const ProductsSliderHomeView({super.key, required this.height});

  @override
  State<ProductsSliderHomeView> createState() => _ProductsSliderHomeViewState();
}

class _ProductsSliderHomeViewState extends State<ProductsSliderHomeView> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  void initState() {
    getProductsCubit(context).selectedSliderImage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productsCubitProvider = getProductsCubit(context);
    final imagesList = productsCubitProvider.productsImageSliderList;
    final theme = Theme.of(context);
    final widgetHeight = widget.height * 0.55;
    return SizedBox(
      height: widgetHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: widgetHeight,
            child: PageView.builder(
              allowImplicitScrolling: true,
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

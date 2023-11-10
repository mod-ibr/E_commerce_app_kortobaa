import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'product_view_price_text.dart';

class AmountRowProductView extends StatelessWidget {
  final String price;
  const AmountRowProductView({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final productsCubitProvider = getProductsCubit(context);
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconButtonWidget(
                  context: context,
                  iconData: Icons.add,
                  onPressed: productsCubitProvider.incrementAAmount),
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    return Text(
                      productsCubitProvider.amount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    );
                  },
                ),
              ),
              iconButtonWidget(
                  context: context,
                  iconData: Icons.remove,
                  onPressed: productsCubitProvider.decrementAAmount,
                  reversed: true),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
            color: theme.colorScheme.tertiary,
            child: PriceTextProductView(price: price, isColored: true),
          ),
        )
      ],
    );
  }

  Widget iconButtonWidget(
      {required BuildContext context,
      required IconData iconData,
      required Function onPressed,
      bool reversed = false}) {
    final theme = Theme.of(context);

    return Ink(
      decoration: ShapeDecoration(
        color: theme.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: reversed ? Radius.zero : const Radius.circular(8),
            bottomStart: reversed ? Radius.zero : const Radius.circular(8),
            bottomEnd: !reversed ? Radius.zero : const Radius.circular(8),
            topEnd: !reversed ? Radius.zero : const Radius.circular(8),
          ),
        ),
      ),
      child: IconButton(
        icon: Icon(iconData),
        color: theme.colorScheme.tertiary,
        onPressed: () => onPressed(),
      ),
    );
  }
}

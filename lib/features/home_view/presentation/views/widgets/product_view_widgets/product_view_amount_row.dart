import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/presentation/views/widgets/custom_icon_button.dart';
import '../../../manager/products cubit/products_cubit.dart';
import '../../../manager/products cubit/products_state.dart';
import 'product_view_price_text.dart';

class AmountRowProductView extends StatelessWidget {
  final String price;
  final Widget? endChild;
  const AmountRowProductView({super.key, required this.price, this.endChild});

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
              IconButtonCustom(
                  iconData: Icons.add,
                  onPressed: productsCubitProvider.incrementAAmount,
                  isRounded: endChild != null ? null : false),
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
              IconButtonCustom(
                  iconData: Icons.remove,
                  onPressed: productsCubitProvider.decrementAAmount,
                  isRounded: endChild != null ? null : true),
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
        ),
        endChild ?? const SizedBox.shrink()
      ],
    );
  }
}

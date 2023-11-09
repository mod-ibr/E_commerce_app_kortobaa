import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_cubit.dart';
import 'package:e_commerce_app/features/home_view/presentation/manager/products%20cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountRowProductView extends StatelessWidget {
  const AmountRowProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final productsCubitProvider = getProductsCubit(context);
    final theme = Theme.of(context);
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ink(
              decoration: ShapeDecoration(
                color: theme.colorScheme.secondary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(8),
                    bottomStart: Radius.circular(8),
                  ),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                color: theme.colorScheme.tertiary,
                onPressed: () => productsCubitProvider.incrementAAmount(),
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  return Text(
                    productsCubitProvider.amount.toString(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  );
                },
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: theme.colorScheme.secondary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(8),
                    bottomEnd: Radius.circular(8),
                  ),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.remove),
                color: theme.colorScheme.tertiary,
                onPressed: () => productsCubitProvider.decrementAAmount(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

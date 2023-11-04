import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/views/widgets/error_widget.dart';
import '../../../../../core/presentation/views/widgets/loading_widget.dart';
import '../../../../../core/utils/functions/map_failure_to_message.dart';
import '../../manager/categories_cubit/categories_cubit.dart';
import '../../manager/categories_cubit/categories_state.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const LoadingWidget();
        } else if (state is CategoriesFailure) {
          String message = mapFailureToMessage(state.failure, context);
          return ErrorWidgetCustom(message: message);
        }
        return const SafeArea(
            child: Center(
          child: Text("Categories View"),
        ));
      },
    );
  }
}

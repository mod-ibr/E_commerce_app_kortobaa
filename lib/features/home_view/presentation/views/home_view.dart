import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/presentation/views/widgets/drawer.dart';
import 'widgets/home_view_widgets/home_view_app_bar.dart';
import 'widgets/home_view_widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      drawer: const DrawerCustom(),
      body: Column(
        children: [
          const AppBarHomeView(),
          Expanded(
            child: Container(
              color: theme.colorScheme.surface,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: const HomeViewBody(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

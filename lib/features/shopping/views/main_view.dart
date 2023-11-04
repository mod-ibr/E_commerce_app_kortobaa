import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce_app/features/shopping/manager/shopping_cubit/shopping_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    ShoppingCubit shoppingCubit = getShoppingCubit(context);
    final theme = Theme.of(context);
    final Map<String, IconData> tabsIcons = shoppingCubit.getTabsIcons(context);
    return BlocBuilder<ShoppingCubit, ShoppingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          body: shoppingCubit.pages[shoppingCubit.bottomNavIndex],
          floatingActionButton: SizedBox(
            width: 60.w,
            height: 60.w,
            child: FloatingActionButton(
              backgroundColor: theme.colorScheme.primary,
              onPressed: () => shoppingCubit.showCartPage(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '352',
                      style: theme.textTheme.labelLarge
                          ?.copyWith(color: theme.colorScheme.tertiary),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: theme.colorScheme.tertiary,
                    )
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: tabsIcons.length,
            tabBuilder: (index, isActive) {
              final tabLabel = tabsIcons.keys.elementAt(index);
              final tabIcon = tabsIcons[tabLabel];
              return customTabIcon(
                  iconData: tabIcon!, label: tabLabel, isActive: isActive);
            },
            elevation: 6,
            height: 60.h,
            activeIndex: shoppingCubit.bottomNavIndex,
            gapLocation: GapLocation.center,
            onTap: (index) => shoppingCubit.showPageByIndex(index),
          ),
        );
      },
    );
  }

  Widget customTabIcon(
      {required IconData iconData,
      required String label,
      required bool isActive}) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: isActive
              ? theme.colorScheme.secondary
              : theme.colorScheme.onPrimary,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: isActive
                ? theme.colorScheme.secondary
                : theme.colorScheme.onPrimary,
          ),
        )
      ],
    );
  }
}

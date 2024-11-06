import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:educational_app/core/theme/colors.dart';
import 'package:educational_app/features/Favourite/presentation/view_model/fav_cubit.dart';
import 'package:educational_app/features/Favourite/presentation/views/fav_view.dart';
import 'package:educational_app/features/cart/presentation/views/cart_empty_view.dart';
import 'package:educational_app/features/home_screen/presentation/views/home_view.dart';
import 'package:educational_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBody extends StatefulWidget {
  const BottomNavBody({super.key});

  @override
  State<BottomNavBody> createState() => _BottomNavBodyState();
}

class _BottomNavBodyState extends State<BottomNavBody> {
  final _pageController = PageController();
  final _controller = NotchBottomBarController();
  int maxCount = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          _widgetOptions(context).length,
          (index) => _widgetOptions(context)[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (_widgetOptions(context).length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              showLabel: false,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              showShadow: false,
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: ColorApp.primaryColor,
                  ),
                  itemLabel: 'HomeView',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite_outline_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.favorite_outline_outlined,
                    color: ColorApp.primaryColor,
                  ),
                  itemLabel: 'FavouriteView',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.shopping_basket,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.shopping_basket,
                    color: ColorApp.primaryColor,
                  ),
                  itemLabel: 'CardView',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: ColorApp.primaryColor,
                  ),
                  itemLabel: 'ProfileView',
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }

  List<Widget> _widgetOptions(BuildContext context) {
    final favCubit = BlocProvider.of<FavCubit>(context);

    return [
      const HomeView(),
      BlocProvider<FavCubit>.value(
        value: favCubit,
        child: const FavView(),
      ),
      const CardView(),
      const ProfileView(),
    ];
  }
}

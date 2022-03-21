import 'dart:async';

import 'package:pessa_flow/common/common.dart';
import 'package:pessa_flow/constants/route.dart';
import 'package:pessa_flow/constants/unicode_values.dart';
import 'package:pessa_flow/extensions/extension.dart';
import 'package:pessa_flow/generated/l10n.dart';
import 'package:pessa_flow/model/model.dart';
import 'package:pessa_flow/network/base_api_service.dart';
import 'package:pessa_flow/pref/app_pref.dart';
import 'package:pessa_flow/res/colors.dart';
import 'package:pessa_flow/res/images.dart';
import 'package:pessa_flow/ui/main/cards/cards_view.dart';

import 'package:pessa_flow/ui/main/profile/profile_view.dart';
import 'package:pessa_flow/ui/main/transaction/transaction_view.dart';
import 'package:pessa_flow/utils/app_logger.dart';
import 'package:pessa_flow/utils/base_cubit.dart';
import 'package:pessa_flow/utils/circle_navigation/circle_bottom_navigation.dart';
import 'package:pessa_flow/utils/circle_navigation/widgets/tab_data.dart';
import 'package:pessa_flow/utils/ff_navigation/ff_navigation_bar.dart';
import 'package:pessa_flow/widgets/widgets.dart';
import 'package:animations/animations.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_view.dart';

part 'main_cubit.dart';

part 'main_state.dart';

part 'main_service.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final listIcons = [
    AppImage.homeTab,
    AppImage.transactionTab,
    AppImage.cardsTab,
    AppImage.profileTab,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) =>
            previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          Widget title = const SizedBox.shrink();
          switch (state.currentIndex) {
            case 0:
              title = Row(
                children: [
                  const SizeBoxV(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonText.bold(
                          S.of(context).hello,
                          size: 18,
                          color: AppColor.primary,
                        ),
                        CommonText.semiBold(state.user.FirstName,
                            size: 14, color: AppColor.textPrimaryLight),
                      ],
                    ),
                  )
                ],
              );
              break;
            case 1:
              title = CommonText.bold(
                S.of(context).transactionsHistory,
                size: 24,
                color: AppColor.primary,
              );
              break;
            case 2:
              title = CommonText.bold(
                S.of(context).cards,
                size: 24,
                color: AppColor.primary,
              );
              break;
            case 3:
              title = const SizedBox.shrink();
              break;
          }

          Widget child = BlocProvider(
            create: (context) => HomeCubit(context),
            child: const HomeView(),
          );
          switch (state.currentIndex) {
            case 1:
              child = BlocProvider(
                create: (context) => TransactionCubit(context),
                child: const TransactionsView(),
              );
              break;
            case 2:
              child = BlocProvider(
                  create: (context) => CardsCubit(context),
                  child: const CardsView());
              break;
            case 3:
              child = const ProfileView();
              break;
          }
          return Column(
            children: [
              SizeBoxH(context.topPadding),
              state.currentIndex != 3 && state.currentIndex != 0
                  ? Container(
                      decoration: BoxDecoration(
                        color: state.currentIndex == 0
                            ? const Color(0xFFF9FCFF)
                            : AppColor.transparent,
                      ),
                      height: 72,
                      padding: const EdgeInsets.fromLTRB(20, 8, 4, 8),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                            child: title,
                          ),
                          BlocBuilder<MainCubit, MainState>(
                            buildWhen: (previous, current) =>
                                previous.hasNotification !=
                                current.hasNotification,
                            builder: (context, state) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: BlocProvider.of<MainCubit>(context)
                                    .notificationClick,
                                child: const SquareImageFromAsset(
                                  AppImage.notification,
                                  size: 48,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: MediaQuery(
                  data: context.mediaQuery.removePadding(removeTop: true),
                  child: PageTransitionSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (child, primaryAnimation, secondaryAnimation) {
                      return SharedAxisTransition(
                        child: child,
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.scaled,
                        fillColor: AppColor.scaffoldBackground,
                      );
                    },
                    child: child,
                  ),
                ),
              ),
              const SizeBoxH(12)
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) =>
            previous.isNavigationBarVisible != current.isNavigationBarVisible,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.fromLTRB(0.0, 8, 0.0, 0.0),
            decoration: const BoxDecoration(
                color: AppColor.primaryDark,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: BlocBuilder<MainCubit, MainState>(
              buildWhen: (previous, current) =>
                  previous.currentIndex != current.currentIndex,
              builder: (context, state) {
                return /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                      listIcons.length,
                      (index) => BottomNavigationItem(
                            icon: listIcons[index],
                            isSelected: state.currentIndex == index,
                            onTap: () => BlocProvider.of<MainCubit>(context).changeIndex(index),
                          )),
                )*/ /*CircleBottomNavigation(
                  initialSelection: state.currentIndex,
                  activeIconColor: AppColor.white,
                  circleColor: Colors.red,
                  inactiveIconColor: AppColor.grey,
                  textColor: AppColor.white,
                  barBackgroundColor: AppColor.primary,
                  hasElevationShadows: false,
                  circleOutline: 0,
                  barHeight: 60.0,
                  arcHeight: 60,
                  arcWidth: 80,
                  circleSize: 42,
                  tabs: List.generate(
                      listIcons.length,
                          (index) => TabData(
                            title: state.listTitle[index],
                        icon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SquareSvgImageFromAsset(
                              listIcons[index],
                              size: 48,
                              color: AppColor.white ,
                            ))
                      )),
                  onTabChangedListener: (index) => BlocProvider.of<MainCubit>(context).changeIndex(index),
                )*/
                    FFNavigationBar(
                  theme: FFNavigationBarTheme(
                      barBackgroundColor: AppColor.primary,
                      selectedItemBorderColor: AppColor.black,
                      selectedItemBackgroundColor: AppColor.red,
                      selectedItemIconColor: AppColor.white,
                      selectedItemLabelColor: AppColor.white,
                      unselectedItemIconColor: AppColor.grey,
                      unselectedItemLabelColor: AppColor.grey,
                      unselectedItemBackgroundColor: AppColor.transparent,
                      selectedItemTextStyle: const TextStyle(
                        fontFamily: kFontFamily,
                        color: AppColor.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      unselectedItemTextStyle: const TextStyle(
                        fontFamily: kFontFamily,
                        color: AppColor.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )),
                  selectedIndex: state.currentIndex,
                  onSelectTab: (index) =>
                      BlocProvider.of<MainCubit>(context).changeIndex(index),
                  items: List.generate(
                      listIcons.length,
                      (index) => FFNavigationBarItem(
                          selectedBackgroundColor: AppColor.red,
                          selectedLabelColor: AppColor.white,
                          label: state.listTitle[index],
                          iconData: index == 2 && index == state.currentIndex
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SquareSvgImageFromAsset(
                                    listIcons[index],
                                    size: 24,
                                    color: index == state.currentIndex
                                        ? AppColor.white
                                        : AppColor.deselected,
                                  ),
                                )
                              : SquareSvgImageFromAsset(
                                  listIcons[index],
                                  size: 24,
                                  color: index == state.currentIndex
                                      ? AppColor.white
                                      : AppColor.deselected,
                                ))),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavigationItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.primaryDark,
      borderRadius: BorderRadius.circular(40),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColor.black.withOpacity(0.5),
        highlightColor: AppColor.black.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SquareSvgImageFromAsset(
            icon,
            color: isSelected ? AppColor.white : AppColor.deselected,
          ),
        ),
      ),
    );
  }
}

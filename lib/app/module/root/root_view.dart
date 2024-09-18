import 'package:dentistreservation/app/module/history/history_view.dart';
import 'package:dentistreservation/core/theme/app_color.dart';
import 'package:dentistreservation/core/utils/ui_utils.dart';
import 'package:dentistreservation/core/values/images.dart';
import 'package:flutter/material.dart';

import '../booking/booking_view.dart';
import '../home/home_view.dart';

class RootView extends StatefulWidget {
  int currentScreen = 0;

  RootView({required this.currentScreen, super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;
  final screens = [
    HomeView(),
    HistoryView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screens[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomBottomNavBar(
                defaultSelectedIndex: _currentIndex,
                onChange: (val) {
                  setState(() {
                    _currentIndex = val;
                  });
                },
                onFabPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookingView();
                  }));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final Function() onFabPressed;

  const CustomBottomNavBar(
      {this.defaultSelectedIndex = 0,
      required this.onChange,
      required this.onFabPressed});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: UIUtils.borderRadiusAll()),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: bottomNavBarItem(Images.homeSelectedIcon,
                    Images.homeUnselectedIcon, "Home", 0),
              ),
              const Expanded(child: SizedBox()),
              Flexible(
                child: bottomNavBarItem(Images.historySelectedIcon,
                    Images.historyUnselectedIcon, "Riwayat", 1),
              ),
            ],
          ),
        ),
        Padding(
          padding: UIUtils.paddingBottom(16),
          child: FloatingActionButton(
            backgroundColor: AppColor.primary500,
            onPressed: () {
              widget.onFabPressed();
            },
            child: Image.asset(Images.addBookingIcon),
          ),
        )
      ],
    );
  }

  Widget bottomNavBarItem(activeIcon, inactiveIcon, label, index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: kBottomNavigationBarHeight,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: UIUtils.borderRadiusAll()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _selectedIndex == index
              ? Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary100,
                      borderRadius: UIUtils.borderRadiusAll()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        activeIcon,
                        width: 22,
                        height: 22,
                        color: AppColor.primary500,
                      ),
                      Text(
                        label,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary500),
                      )
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      inactiveIcon,
                      width: 22,
                      height: 22,
                      color: AppColor.neutral700,
                    ),
                    Text(
                      label,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColor.neutral700),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

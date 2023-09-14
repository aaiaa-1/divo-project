import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'common/side_menu.dart';
import 'common/widgets/menu_btn.dart';
import 'features/admin/screens/admin_dashboard.dart';
import 'features/orders/screens/orders_dashboard.dart';
import 'features/orders/screens/orders_history.dart';
import 'package:divo/utils/rive_utils.dart';


class MainApp extends StatefulWidget {
  static const String routeName = '/main-app';
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  Widget _currentScreen = const OrdersDash();
  String _selectedMenuItem = OrdersDash.routeName;

  // Define a function to handle menu item selection
  void handleMenuItemSelected(String routeName) {
    if (routeName == AdminDash.routeName) {
      _updateScreen(const AdminDash());
    } else if (routeName == OrdersDash.routeName) {
      _updateScreen(const OrdersDash());
    } else if (routeName == OrdersHistory.routeName) {
      _updateScreen(const OrdersHistory());
    }
    setState(() {
      _selectedMenuItem = routeName;
    });
  }

  void _updateScreen(Widget newScreen) {
    setState(() {
      _currentScreen = newScreen;
    });
  }

  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17203A),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              width: 288,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: SideMenu(
                onMenuItemSelected: handleMenuItemSelected,
                selectedMenuItem: _selectedMenuItem,
              )),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 288, 0),
                child: Transform.scale(
                    scale: scaleAnimation.value,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      child: Scaffold(
                        body: _currentScreen,
                      ),
                    ))),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: MenuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachineName: "State Machine");
                isSideBarClosed = controller.findSMI("isOpen") as SMIBool;
                isSideBarClosed.value = true;
              },
              press: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

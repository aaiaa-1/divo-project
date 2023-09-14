
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../features/auth/screens/auth_screen.dart';
import 'package:divo/common/widgets/side_menu_tile.dart';
import 'package:divo/common/widgets/info_card.dart';
import '../models/rive_asset.dart';
import '../utils/rive_utils.dart';

class SideMenu extends StatefulWidget {
  final Function(String) onMenuItemSelected;
  final String selectedMenuItem;
  const SideMenu(
      {super.key,
      required this.onMenuItemSelected,
      required this.selectedMenuItem});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  void onMenuItemSelected(String routeName) {
    widget.onMenuItemSelected(routeName); // Call the callback function
  }

  @override
  void initState() {
    super.initState();
  }

  void navigateToScreen(String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: "McDonald's",
                functionality: "store",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 100, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  press: () {
                    setState(() {
                      selectedMenu = menu;
                    });
                    onMenuItemSelected(menu.routeName);
                    RiveUtils.changeSMIBoolState(menu.input!);
                    // menu.input!.change(true);
                    // Future.delayed(const Duration(seconds: 1), () {
                    //   menu.input!.change(false);
                    // });

                    // navigateToScreen(menu.routeName);
                  },
                  isActive: widget.selectedMenuItem == menu.routeName,
                 
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Divider(
                  color: Colors.white24,
                  height: 1,
                ),
              ),
              ListTile(
                leading: const Icon(
                  CupertinoIcons.square_arrow_left,
                  color: Colors.white,
                  size: 34,
                ),
                title:
                    const Text("Logout", style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Implement logout logic here

                  Navigator.pushNamed(context, AuthScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:rive/rive.dart';

import '../features/admin/screens/admin_dashboard.dart';
import '../features/orders/screens/orders_dashboard.dart';
import '../features/orders/screens/orders_history.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src,routeName;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
      required this.stateMachineName,
      required this.title,
      required this.routeName,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> sideMenus = [
  RiveAsset("assets/rive/icons.riv",
      artboard: "BELL",  // to specify the icon in the .riv file
      stateMachineName: "BELL_Interactivity",  //to execute the animation
      title: "Undelivered Orders", 
      routeName: OrdersDash.routeName), // to navigate between pages
  RiveAsset("assets/rive/icons.riv",
      artboard: "TIMER",
      stateMachineName: "TIMER_Interactivity",
      title: "Orders History",
      routeName: OrdersHistory.routeName),
  RiveAsset("assets/rive/icons.riv",
      artboard: "REFRESH/RELOAD",
      stateMachineName: "RELOAD_Interactivity",
      title: "Edit Menu",
      routeName: AdminDash.routeName),
];

import 'package:flutter/material.dart';

import 'features/admin/screens/admin_dashboard.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/orders/screens/orders_dashboard.dart';
import 'features/orders/screens/orders_history.dart';
import 'main_app.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen()  
        );
        case MainApp.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainApp()  
        );
    case OrdersDash.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrdersDash()  
        );
    case OrdersHistory.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OrdersHistory()  
        );
    case AdminDash.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AdminDash()  
        );
    default:   
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        )
        );

  }
}

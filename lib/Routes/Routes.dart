import 'package:flutter/material.dart';
import 'package:inventory_go/Screens/AuthenticationUI/LoginUI.dart';
import 'package:inventory_go/Screens/CountUI/CountUI.dart';
import 'package:inventory_go/Screens/DashboardUI/DashboardUI.dart';
import 'package:inventory_go/Screens/GrnUI/GrnReceivingUI.dart';
import 'package:inventory_go/Screens/GrnUI/GrnUI.dart';
import 'package:inventory_go/Screens/InventoryUI/InventoryUI.dart';
import 'package:inventory_go/Screens/StocktakingUI/StocktakingUI.dart';
import 'package:inventory_go/Util/route_constants.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as dynamic;
    switch (settings.name) {
      case RouteConstants.initialRoute:
        return PageTransition(
            child: const LoginUI(), type: PageTransitionType.rightToLeft);
      case RouteConstants.dashboard:
        return PageTransition(
            child: const DashbaordUI(), type: PageTransitionType.rightToLeft);
      case RouteConstants.inventory:
        return PageTransition(
            child: const InventoryUI(), type: PageTransitionType.rightToLeft);
      case RouteConstants.grn:
        return PageTransition(
            child: const GrnUI(), type: PageTransitionType.rightToLeft);
      case RouteConstants.grnReceiving:
        return PageTransition(
            child: GrnReceivingUI(args), type: PageTransitionType.rightToLeft);
      case RouteConstants.stocktaking:
        return PageTransition(
            child: const StocktakingUI(), type: PageTransitionType.rightToLeft);
      case RouteConstants.count:
        return PageTransition(
            child: const CountUI(), type: PageTransitionType.rightToLeft);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

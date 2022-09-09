import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Widgets/Dashboard/DashboardMenuCard.dart';
import 'package:inventory_go/Components/Widgets/Drawer/AppDrawer.dart';
import 'package:inventory_go/Util/AppIcons.dart';
import 'package:inventory_go/Util/color_constants.dart';
import 'package:inventory_go/Util/image_constants.dart';
import 'package:inventory_go/Util/route_constants.dart';

class DashbaordUI extends StatefulWidget {
  const DashbaordUI({Key? key}) : super(key: key);

  @override
  State<DashbaordUI> createState() => _DashbaordUIState();
}

class _DashbaordUIState extends State<DashbaordUI> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    ImageConstants.appLogo,
                    width: 200,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'InventoryGo',
                    style: TextStyle(
                        color: ColorConstants.secondary,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 70),
                  Expanded(
                    child: GridView(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 40),
                      children: [
                        DashboardMenuCard(
                          title: 'Inventory',
                          image: ImageConstants.inventory,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(RouteConstants.inventory),
                        ),
                        DashboardMenuCard(
                            title: 'GRN',
                            image: ImageConstants.grn,
                            onPressed: () => Navigator.of(context)
                                .pushNamed(RouteConstants.grn)),
                        DashboardMenuCard(
                            title: 'Stocktaking',
                            image: ImageConstants.stocktaking,
                            onPressed: () => Navigator.of(context)
                                .pushNamed(RouteConstants.stocktaking)),
                        DashboardMenuCard(
                            title: 'Count',
                            image: ImageConstants.count,
                            onPressed: () => Navigator.of(context)
                                .pushNamed(RouteConstants.count)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  icon: const Icon(AppIcons.menu)),
            )
          ],
        ),
      ),
    );
  }
}

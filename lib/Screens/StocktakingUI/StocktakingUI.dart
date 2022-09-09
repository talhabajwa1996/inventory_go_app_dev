import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Scaffold/AppScaffold.dart';
import 'package:inventory_go/Components/Widgets/Stocktaking/ControlPanelStockingtaking.dart';
import 'package:inventory_go/Components/Widgets/Stocktaking/StocktakingList.dart';

class StocktakingUI extends StatefulWidget {
  const StocktakingUI({Key? key}) : super(key: key);

  @override
  State<StocktakingUI> createState() => _StocktakingUIState();
}

class _StocktakingUIState extends State<StocktakingUI> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Stocktaking',
      body: Column(
        children: const [
          ControlPanelStocktaking(),
          Divider(thickness: 2, height: 2),
          Expanded(child: StocktakingList())
        ],
      ),
    );
  }
}

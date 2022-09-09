import 'package:flutter/material.dart';
import 'package:inventory_go/Components/Widgets/GRN/GrnCard.dart';
import 'package:inventory_go/Util/route_constants.dart';

class GrnList extends StatelessWidget {
  const GrnList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemCount: 20,
      itemBuilder: (context, index) => GrnCard(
        item: "AlJawad Trading Est.",
        grnId: '45',
        orderDate: '12-09-2016',
        status: 'Pending',
        onTap: () => Navigator.of(context)
            .pushNamed(RouteConstants.grnReceiving, arguments: '45'),
      ),
    );
  }
}
